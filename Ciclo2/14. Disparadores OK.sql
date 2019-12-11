-- No se puede modificar una sede mientras tenga alguna version activa. 
INSERT INTO ubicaciones (direccion, ciudad, departamento) values ('N27#XI-59', 'Pereira', 'Norte');
insert into sedes (idSede , nombre , ubicacion) values ( 'S0021' , 'Velodromo Bosa' , 'N27#XI-59');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0021','A','Carrera de caballos' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('41',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S0021' ,  'E0021');
DELETE FROM Sedes WHERE idSede = 'S0021';

-- No se puede modificar el documento ni la fecha de nacimiento de un cliente
insert into ubicaciones (direccion, ciudad, departamento) values ('N37#XE-70', 'Pereira', 'Neiva');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6253715857, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'N37#XE-70', 3910569697, 'ment0@moonfruit.com');
UPDATE clientes SET telefono = 3103269941 WHERE documento = 6253715857;

--Solo se puede modificar la periodicidad y los requisitos de un evento
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0040','A','Carrera de caballos' ,'Muy divertida');
UPDATE EventosDeportivos SET periodicidad = 'A' WHERE idEvento = 'E0040';


--El ID de la version se genera automaticamente
INSERT INTO ubicaciones (direccion, ciudad, departamento) values ('N27#KKK-9', 'Pereira', 'Norte');
insert into sedes (idSede , nombre , ubicacion) values ( 'S0070' , 'Velodromo Bosa' , 'N27#KKK-9');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0070','A','Carrera de caballos' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('41',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S0070' ,  'E0070');
