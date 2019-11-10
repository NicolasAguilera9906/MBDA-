/*Autoestudio 4*/

/*Adicionando restricciones declarativas.*/
ALTER TABLE musician ADD CONSTRAINT CK_musician_m_name CHECK(REGEXP_LIKE (m_name,'^[A-Za-z]+ [A-Za-z]+$'));
ALTER TABLE musician ADD CONSTRAINT CK_musician_born_died CHECK (died > born);
ALTER TABLE composer ADD CONSTRAINT CK_composer_comp_type CHECK (comp_type IN ('jazz', 'classical', 'rock', 'blues','not known'));
/*la base de datos ya tiene datos que dañan la integridad para perf_is*/
--ALTER TABLE performer ADD CONSTRAINT UK_perf_is UNIQUE(perf_is);


/*Comprobacion de  restricciones uno que funciona y otro que no por las restricciones*/
--INSERT INTO musician VALUES(43,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'),TO_DATE('1947/01/02','YYYY/MM/DD'),1,2);
INSERT INTO musician VALUES(43,'Fred Bloggs',TO_DATE('1948/01/02','YYYY/MM/DD'),TO_DATE('1949/01/02','YYYY/MM/DD'),1,2);

--INSERT INTO composer VALUES(13,8,'Reguetron');
INSERT INTO composer VALUES(13,8,'not known');


/*Adicionando acciones de referencia*/
/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
ALTER TABLE band DROP CONSTRAINT FK_band_musician; 
ALTER TABLE band ADD CONSTRAINT FK_band_musician  
FOREIGN KEY(band_contact) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE performer DROP CONSTRAINT FK_performer_musician;
ALTER TABLE performer ADD CONSTRAINT FK_performer_musician  
FOREIGN KEY(perf_is) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE performance DROP CONSTRAINT FK_performance_musician;
ALTER TABLE performance ADD CONSTRAINT FK_performance_musician  
FOREIGN KEY(conducted_by) REFERENCES musician(m_no) ON DELETE CASCADE;

ALTER TABLE plays_in DROP CONSTRAINT FK_plays_in_performer;
ALTER TABLE plays_in ADD CONSTRAINT FK_plays_in_performer
FOREIGN KEY(player) REFERENCES performer(perf_no)ON DELETE CASCADE;

/*validar acciiones ok*/ 
DELETE FROM musician WHERE m_no= 4;
/*Adicionando disparadores*/

/*El número se genera automáticamente de forma consecutiva.*/
CREATE OR REPLACE TRIGGER TriggerConsecutivo
BEFORE INSERT ON musician
FOR EACH ROW
DECLARE
tmpv NUMBER; 
BEGIN
SELECT COUNT(*)+1 INTO tmpv FROM musician ;
:new.m_no := tmpv;
END TriggerConsecutivo; 
/

/*disparador ok*/
INSERT INTO musician (m_name,born,died,born_in,living_in) VALUES ('Miguel Fuquene',TO_DATE('1999/01/12','YYYY/MM/DD'),null,6,3);
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES (42,'Nicolas Aguilera',TO_DATE('1999/01/12','YYYY/MM/DD'),null,2,3);
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES (90,'Miguel Aguilera',TO_DATE('1989/01/12','YYYY/MM/DD'),null,2,3);
/*disparadores no ok
NO HAY
*/
DROP TRIGGER TriggerConsecutivo;

/*La ciudad en la que vive por omisión es la ciudad de nacimiento.*/
CREATE OR REPLACE TRIGGER TriggerLiving
BEFORE INSERT ON musician
FOR EACH ROW 
BEGIN
IF :new.living_in IS NULL THEN
:new.living_in := :new.born_in; 
END IF;
END TriggerLiving;
/
/*disparador ok*/
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (27,'Carlos Gomez',TO_DATE('1999/11/13','YYYY/MM/DD'),null,2);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (28,'John Alex',TO_DATE('1999/01/14','YYYY/MM/DD'),null,4);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (29,'Juan Peña',TO_DATE('1999/01/15','YYYY/MM/DD'),null,9);
/*disparadores no ok
NO HAY*/
DROP TRIGGER TriggerLiving;


/*Los compositores sólo pueden componer un tipo de música y los interpretes pueden tocar máximo tres instrumentos.*/
CREATE OR REPLACE TRIGGER TriggerCantInstrument
BEFORE INSERT ON performer
FOR EACH ROW
DECLARE
tmpv NUMBER;
BEGIN
SELECT COUNT(instrument) INTO tmpv FROM performer WHERE perf_is=:new.perf_is;
if tmpv>3 THEN RAISE_application_error(-20007,'No se puede ingresar');
END IF;
END TriggerCantInstrument;
/
/*disparador ok*/
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,3,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,3,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (32,15,'guitar','jazz');
/*disparadores no ok
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,2,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,6,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,8,'guitar','jazz');
*/
DROP TRIGGER TriggerCantInstrument;


/*Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)*/
CREATE OR REPLACE TRIGGER  TriggerTipoMusica
BEFORE INSERT ON composer
FOR EACH ROW
DECLARE
perf_x NUMBER;
type_x VARCHAR(10);
BEGIN
  SELECT COUNT(perf_is) INTO perf_x FROM performer WHERE :new.comp_is = perf_is;
  IF :new.comp_type IS NULL AND perf_x = 1 THEN 
  SELECT perf_type INTO type_x FROM performer WHERE :new.comp_is = perf_is;
  :new.comp_type := type_x ;
  ELSE raise_application_error(-20050,'Hay mas de un tipo');
  END IF;
END TriggerTipoMusica;
/
/*disparador ok*/
INSERT INTO composer (comp_no,comp_is) VALUES (16,6);
INSERT INTO composer (comp_no,comp_is) VALUES (15,15);
INSERT INTO composer (comp_no,comp_is) VALUES (16,5);
/*disparadores no ok
INSERT INTO composer (comp_no,comp_is) VALUES (15,2);
INSERT INTO composer (comp_no,comp_is) VALUES (15,4);
INSERT INTO composer (comp_no,comp_is) VALUES (15,6);
*/
DROP TRIGGER TriggerTipoMusica;



/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
CREATE OR REPLACE TRIGGER TriggerDelMusico
BEFORE DELETE ON musician
FOR EACH ROW
DECLARE
comp NUMBER ;
orgniser NUMBER ;
BEGIN
    SELECT COUNT(*) INTO comp FROM composer WHERE :old.m_no= comp_is;
    SELECT COUNT(*) INTO orgniser FROM concert WHERE :old.m_no= concert_orgniser;
    IF comp > 0 or orgniser >0  THEN
      raise_application_error(-20004,'No se puede eliminar');
    END IF;
END TriggerDelMusico;
/
/*disparador ok*/
DELETE FROM musician WHERE m_no= 4;
/*disparadores no ok
DELETE FROM musician WHERE m_no= 17;
DELETE FROM musician WHERE m_no= 3;
DELETE FROM musician WHERE m_no= 8;
*/
DROP TRIGGER TriggerDelMusico;

/*No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el músico y la fecha de muerte.*/
CREATE OR REPLACE TRIGGER TriggerUpdateMusician
BEFORE UPDATE ON musician
FOR EACH ROW
BEGIN
  IF :new.m_no <> :old.m_no or :new.m_name<> :old.m_name or :new.born<>:old.born or  :new.born_in<> :old.born_in THEN
    :new.m_no:=:old.m_no; 
    :new.m_name:= :old.m_name;
    :new.born:=:old.born;
    :new.born_in:= :old.born_in;
  END IF;    
END TriggerUpdateMusician;
/

/*disparador ok*/
UPDATE musician SET m_name= 'Ana' WHERE m_no= 1;
UPDATE musician SET living_in= 3 WHERE m_no= 1;
UPDATE musician SET died= TO_DATE('1999/01/14','YYYY/MM/DD') WHERE m_no= 1;
/*disparadores no ok
NO HAY
*/
DROP TRIGGER TriggerUpdateMusician;
