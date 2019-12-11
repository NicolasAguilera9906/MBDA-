                                                                                                            /* Poblar OK */ 
-- Poblar Ubicaciones
insert into ubicaciones (direccion, ciudad, departamento) values ('K079#Aq-2', 'Pereira', 'Norte');
insert into ubicaciones (direccion, ciudad, departamento) values ('v96#-74', 'Cucuta', 'Antioquia');
insert into uBicaciones (direccion, ciudad, departamento) values ('p#M-1', 'Quindio', 'Norte');
insert into ubicaciones (direccion, ciudad, departamento) values ('U406#-15', 'Bogota', 'Neiva');
insert into ubicaciones (direccion, ciudad, departamento) values ('T61#PG-1', 'Cali', 'Neiva');
insert into ubicaciones (direccion, ciudad, departamento) values ('q#vg-6', 'Medellin', 'Norte');
insert into ubicaciones (direccion, ciudad, departamento) values ('X#-5', 'Pereira', 'Valle');
insert into ubicaciones (direccion, ciudad, departamento) values ('g#-45', 'Bogota', 'Armenia');
insert into ubicaciones (direccion, ciudad, departamento) values ('J#-', 'Quindio', 'Cundina');
insert into ubicaciones (direccion, ciudad, departamento) values ('N37#XE-59', 'Pereira', 'Neiva');

-- Poblar Clientes
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6253715857, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'K079#Aq-2', 3910569397, 'mkliement0@moonfruit.com');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6515503247, 'Migue',TO_DATE('1775/12/12','YYYY/MM/DD'), 'v96#-74', 6078336185, 'bvondrach1@sogou.com');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (5581748409, 'Maria',TO_DATE('1741/09/26','YYYY/MM/DD'), 'p#M-1', 1136775281, 'bbridgestock2@home.pl');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (4493007383, 'Simon',TO_DATE('1897/10/06','YYYY/MM/DD'), 'U406#-15', 8980936804, 'dmordecai3@timesonline.co.uk');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (3882103963, 'Andre',TO_DATE('1987/06/25','YYYY/MM/DD'), 'T61#PG-1', 2092665553, 'hvogeler4@ox.ac.uk');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (9984566521, 'Andre',TO_DATE('1843/11/15','YYYY/MM/DD'), 'q#vg-6', 3271332683, 'wventham5@nsw.gov.au');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (1347047662, 'Migue',TO_DATE('1955/12/13','YYYY/MM/DD'), 'X#-5', 5870516781, 'fklemke6@spotify.com');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (4142926492, 'Andre',TO_DATE('1788/07/15','YYYY/MM/DD'), 'g#-45', 5727918500, 'tserfati7@google.com.br');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (7997742725, 'Mateo',TO_DATE('1977/07/25','YYYY/MM/DD'), 'J#-', 2647635968, 'ccrayk8@goo.gl');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6037113829, 'Maria',TO_DATE('1803/07/17','YYYY/MM/DD'), 'N37#XE-59', 9498281152, 'ytatem9@prweb.com');

-- Poblar Sedes
insert into sedes (idSede , nombre , ubicacion) values ( 'S001' , 'Estadio Atlantico' , 'K079#Aq-2');
insert into sedes (idSede , nombre , ubicacion) values ( 'S002' , 'Velodromo Barranquilla' , 'v96#-74');
insert into sedes (idSede , nombre , ubicacion) values ( 'S003' , 'Pista Bogotá' , 'p#M-1');
insert into sedes (idSede , nombre , ubicacion) values ( 'S004' , 'Estadio Cali' , 'U406#-15');
insert into sedes (idSede , nombre , ubicacion) values ( 'S005' , 'Estadio Cucuta' , 'T61#PG-1');
insert into sedes (idSede , nombre , ubicacion) values ( 'S006' , 'Complejo Acutatico VL' , 'q#vg-6');
insert into sedes (idSede , nombre , ubicacion) values ( 'S007' , 'Estadio Pamplona' , 'X#-5');
insert into sedes (idSede , nombre , ubicacion) values ( 'S008' , 'Estadio Chia' , 'g#-45');
insert into sedes (idSede , nombre , ubicacion) values ( 'S009' , 'Estadio Zipaquira' , 'J#-');
insert into sedes (idSede , nombre , ubicacion) values ( 'S0010' , 'Velodromo Bosa' , 'N37#XE-59');

--Poblar EventosDeportivos

insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E001','A','Carrera de caballos' , 'Muy divertida');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E002','S','Natacion' , 'Muy feliz');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E003','S','Liga Futbol' , 'Competitivo');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E004','S','Torneo Ajedrez' , 'Dificil');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E005','S','Tiro al arco' , 'Muy divertida');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E006','S','Ciclismo CO' , 'Muy feliz');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E007','A','Patinaje CO' , 'Muy amistosa');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E008','A','Automovilismo' , 'Muy divertida');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E009','S','Tenis CO' , 'Muy emocionante');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0010','A','Basketball CO' , 'Muy divertida');

-- Poblar Versiones
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('1',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S001' ,  'E001');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('2',TO_DATE('2015/01/03' , 'YYYY/MM/DD') , TO_DATE('2016/04/03' , 'YYYY/MM/DD') , 'S002' ,  'E002');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('3',TO_DATE('2014/01/03' , 'YYYY/MM/DD') , TO_DATE('2015/03/03' , 'YYYY/MM/DD') , 'S003' ,  'E003');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('4',TO_DATE('2013/01/03' , 'YYYY/MM/DD') , TO_DATE('2014/02/03' , 'YYYY/MM/DD') , 'S004' ,  'E004');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('5',TO_DATE('2012/01/03' , 'YYYY/MM/DD') , TO_DATE('2013/01/03' , 'YYYY/MM/DD') , 'S005' ,  'E005');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('6',TO_DATE('2011/01/03' , 'YYYY/MM/DD') , TO_DATE('2012/12/03' , 'YYYY/MM/DD') , 'S001' ,  'E006');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('7',TO_DATE('2010/01/03' , 'YYYY/MM/DD') , TO_DATE('2011/11/03' , 'YYYY/MM/DD') , 'S007' ,  'E007');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('8',TO_DATE('2019/01/03' , 'YYYY/MM/DD') , TO_DATE('2020/12/03' , 'YYYY/MM/DD') , 'S008' ,  'E008');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('9',TO_DATE('2018/01/03' , 'YYYY/MM/DD') , TO_DATE('2019/12/03' , 'YYYY/MM/DD') , 'S009' ,  'E009');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('10',TO_DATE('2017/01/03' , 'YYYY/MM/DD') , TO_DATE('2018/12/03' , 'YYYY/MM/DD') , 'S001' ,  'E001');

--Poblar Registros
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '1' , 6253715857 , TO_DATE('2016/01/03' , 'YYYY/MM/DD') , 2300 , 50000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '2' , 6515503247 , TO_DATE('2014/01/03' , 'YYYY/MM/DD') , 1900 , 600000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '3' , 5581748409 , TO_DATE('2013/01/03' , 'YYYY/MM/DD') , 1800 , 70000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '4' , 4493007383 , TO_DATE('2018/01/03' , 'YYYY/MM/DD') , 1400 , 60000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '5' , 3882103963 , TO_DATE('2019/01/03' , 'YYYY/MM/DD') , 1300 , 40000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '6' , 9984566521 , TO_DATE('2020/01/03' , 'YYYY/MM/DD') , 1000 , 20000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '7' , 1347047662 , TO_DATE('2019/01/03' , 'YYYY/MM/DD') , 1100 , 10000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '8' , 4142926492 , TO_DATE('2018/01/03' , 'YYYY/MM/DD') , 1200 , 220000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '9' , 7997742725 , TO_DATE('2016/01/03' , 'YYYY/MM/DD') , 1300 , 330000);
insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( '1' , 6037113829 , TO_DATE('2014/01/03' , 'YYYY/MM/DD') , 1400 , 4450000);

--Poblar Fotos
insert into Fotos ( url , version) VALUES ('www.V001.png' , '1');
insert into Fotos ( url , version) VALUES ('www.V002.png' , '2');
insert into Fotos ( url , version) VALUES ('www.V003.png' , '3');
insert into Fotos ( url , version) VALUES ('www.V004.png' , '4');
insert into Fotos ( url , version) VALUES ('www.V005.png' , '5');
insert into Fotos ( url , version) VALUES ('www.V006.png' , '6');
insert into Fotos ( url , version) VALUES ('www.V007.png' , '7');
insert into Fotos ( url , version) VALUES ('www.V008.png' , '8');
insert into Fotos ( url , version) VALUES ('www.V009.png' , '9');
insert into Fotos ( url , version) VALUES ('www.V0010.png' , '10');


