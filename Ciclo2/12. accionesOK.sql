--Si se elimina un evento , también se eliminan sus versiones.
INSERT INTO ubicaciones (direccion, ciudad, departamento) values ('K079#', 'Pereira', 'Norte');
INSERT INTO sedes (idSede , nombre , ubicacion) values ( 'S005' , 'Estadio Atlantico' , 'K079#');
INSERT INTO EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E005','A','Carrera de caballos' , 'Muy divertida');
INSERT INTO Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('5',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S002' ,  'E005');
DELETE FROM EventosDeportivos WHERE idEvento = 'E005';