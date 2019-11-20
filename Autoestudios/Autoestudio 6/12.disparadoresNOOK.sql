/*Los compositores sólo pueden componer un tipo de música y los interpretes pueden tocar máximo tres instrumentos.*/
/*
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (30,2,'violin','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,6,'guitar','jazz');
INSERT INTO performer (perf_no,perf_is,instrument,perf_type) VALUES (31,8,'guitar','jazz');
*/

/*Si no se indica el tipo de música de un compositor, se supone que el tipo de música que sabe interpretar (si solamente es uno)*/
/*
INSERT INTO composer (comp_no,comp_is) VALUES (15,2);
INSERT INTO composer (comp_no,comp_is) VALUES (15,4);
INSERT INTO composer (comp_no,comp_is) VALUES (15,6);
*/

/*Los músicos siempre se pueden eliminar, si no tienen composiciones o no figuran como organizadores de conciertos.*/
/*
DELETE FROM musician WHERE m_no= 17;
DELETE FROM musician WHERE m_no= 3;
DELETE FROM musician WHERE m_no= 8;
*/