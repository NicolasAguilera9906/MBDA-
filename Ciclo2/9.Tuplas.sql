                                                                        /* Tuplas */
--La fecha de Inicio de un evento debe ser menor a la fecha de Fin del mismo
ALTER TABLE versiones ADD CONSTRAINT TUP_VERSIONES_FECHAS
CHECK (
    fechaInicio<=fechaFin
);
                                                                        /* Tuplas OK */
--La fecha de Inicio de una version de un evento
insert into ubicaciones (direccion, ciudad, departamento) values ('K079#Aq-2', 'Pereira', 'Norte');
insert into sedes (idSede , nombre , ubicacion) values ( 'S001' , 'Estadio Atlantico' , 'K079#Aq-2');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E001','A','Carrera de caballos' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('1',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S001' ,  'E001');

                                                                        /* Tuplas NO OK */
                                                                    
insert into ubicaciones (direccion, ciudad, departamento) values ('K079#q-3', 'Pereira', 'Norte');
insert into sedes (idSede , nombre , ubicacion) values ( 'S002' , 'Estadio Atlantico' , 'K079#q-3');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E002','A','Carrera de caballos' , 'Muy divertida');
/*insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('2',TO_DATE('2020/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S002' ,  'E002');*/

