/*disparador ok*/
/*El número se genera automáticamente de forma consecutiva.*/
INSERT INTO musician (m_name,born,died,born_in,living_in) VALUES ('Miguel Fuquene',TO_DATE('1999/01/12','YYYY/MM/DD'),null,6,3);
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES (42,'Nicolas Aguilera',TO_DATE('1999/01/12','YYYY/MM/DD'),null,2,3);
INSERT INTO musician (m_no,m_name,born,died,born_in,living_in) VALUES (90,'Miguel Aguilera',TO_DATE('1989/01/12','YYYY/MM/DD'),null,2,3);

/*La ciudad en la que vive por omisión es la ciudad de nacimiento.*/
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (27,'Carlos Gomez',TO_DATE('1999/11/13','YYYY/MM/DD'),null,2);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (28,'John Alex',TO_DATE('1999/01/14','YYYY/MM/DD'),null,4);
INSERT INTO musician (m_no,m_name,born,died,born_in) VALUES (29,'Juan Pe',TO_DATE('1999/01/15','YYYY/MM/DD'),null,9);

/*Los compositores sólo pueden componer un tipo de música y los interpretes pueden tocar máximo tres instrumentos.*/
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,3,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,3,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (32,15,'guitar','jazz');

/*Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)*/
INSERT INTO composer (comp_no,comp_is) VALUES (15,15);
INSERT INTO composer (comp_no,comp_is) VALUES (16,5);

/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
DELETE FROM musician WHERE m_no= 4;

/*No es posible modificar ninguno de los datos que ya tienen valor salvo el sitio donde vive el músico y la fecha de muerte.*/
UPDATE musician SET m_name= 'Ana' WHERE m_no= 1;
UPDATE musician SET living_in= 3 WHERE m_no= 1;
UPDATE musician SET died= TO_DATE('1999/01/14','YYYY/MM/DD') WHERE m_no= 1;