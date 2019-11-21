/*disparador ok*/
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