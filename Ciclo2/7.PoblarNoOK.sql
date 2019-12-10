                                                                                                                /* Poblar NO OK */


--Caracteres no validos en la ubicacion
--insert into ubicaciones (direccion, ciudad, departamento) values ('K079#$$$Aq-2', 'Pereira', 'Norte');

--Documento del cliente mayor a lo precisado
--insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (62537158579999999999, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'K079#Aq-2', 3910569397, 'mkliement0@moonfruit.com');

--Correo invalido
--insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6253715657, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'K079#Aq-2', 3910569397, 'mkliement0moonfruit.com');

--La ubicacion no puede ser nula
--insert into sedes (idSede , nombre , ubicacion) values ( 'S001' , 'Estadio Atlantico' , NULL);

--La periodicidad debe ser 'A' o 'S'
--insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0020','C','Carrera de caballos' , 'Muy divertida');

--Hora invalida
--insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( 'V008' , 6253715857 , TO_DATE('2016/01/03' , 'YYYY/MM/DD') , 2500 , 50000);
--insert into Registros (version , cliente , fechaRegistro , horaRegistro , precio) VALUES ( 'V008' , 6253715857 , TO_DATE('2016/01/03' , 'YYYY/MM/DD') , 2060 , 50000);

--Url invalida
--insert into Fotos ( url , version) VALUES ('www.V001.com' , 'V001');
