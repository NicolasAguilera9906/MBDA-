-- No se puede modificar una sede mientras tenga alguna version activa. 
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) values ('N27#XI-50', 'Pereira', 'Norte');
insert into sedes (idSede , nombre , ubicacion) values ( 'S0020' , 'Velodromo Bosa' , 'N27#XI-50');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0020','A','Carrera de caballos' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('42',TO_DATE('2019/01/03' , 'YYYY/MM/DD') , TO_DATE('2020/05/03' , 'YYYY/MM/DD') , 'S0020' ,  'E0020');
DELETE FROM Sedes WHERE idSede = 'S0020';*/

--  No se puede modificar ni eliminar una ubicacion
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) values ('N70#XI-70', 'Pereira', 'Norte');
UPDATE ubicaciones SET ciudad = 'Bogota' WHERE direccion = 'N70#XI-70';
DELETE FROM ubicaciones WHERE direccion = 'N70#XI-70';*/

-- No se puede modificar el documento ni la fecha de nacimiento de un cliente
/*insert into ubicaciones (direccion, ciudad, departamento) values ('N37#XE-30', 'Pereira', 'Neiva');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6253715600, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'N37#XE-30', 3910569697, 'mt0@moonfruit.com');
UPDATE clientes SET documento = 1014308690 WHERE documento = 6253715600;*/

--Solo se puede modificar la periodicidad y los requisitos de un evento
/*insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0040','A','Carrera de caballos' ,'Muy divertida');
UPDATE EventosDeportivos SET nombre = 'CarreraE' WHERE idEvento = 'E0040';*/