                                                                /*PC_SEDE*/
insert into ubicaciones (direccion, ciudad, departamento) values ('carrera#98', 'Pereira', 'Norte');
--Adicionar
BEGIN
    PC_SEDE.AD_SEDE( 'S0051' , 'Estadio Atlantico' , 'carrera#98');
END;
/
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0400','A','Basketball CO' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('1',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S0051' ,  'E0400');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('1',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S0051' ,  'E0400');
--Modificar
BEGIN
    PC_SEDE.MOD_SEDE('S0051' , 'Velodromo');
END;
/
--Consultar
SELECT PC_SEDE.CO_SEDE('S0051') FROM DUAL;

--Adicionar                                                                
Begin
    PC_SEDE.AD_UBICACION('carrera71bis#68','Bogota','Cundinamarca');
END;
/
--Consultar
SELECT 
    PC_SEDE.CO_UBICACION('carrera71bis#68') 
FROM DUAL;
--Consultar sedes activas
INSERT INTO ubicaciones (direccion, ciudad, departamento) values ('K080', 'Pereira', 'Norte');
INSERT INTO sedes (idSede , nombre , ubicacion) values ( 'S0040' , 'Estadio Atlantico' , 'K080');
INSERT INTO EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E0060','A','Carrera de caballos' , 'Muy divertida');
INSERT INTO Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('5',TO_DATE('2019/01/03' , 'YYYY/MM/DD') , TO_DATE('2020/05/03' , 'YYYY/MM/DD') , 'S0040' ,  'E0060');
SELECT PC_SEDE.CO_SEDES_ACTIVAS FROM DUAL;

INSERT INTO ubicaciones values ('carrer65bis#68','Bogota','Cundinamarca');

                                                        /* PC_CLIENTE */
--Adicionar
BEGIN
    PC_CLIENTE.AD_CLIENTE(1014308690, 'Nicolas', TO_DATE('2000/06/16','YYYY/MM/DD'), 'carrer65bis#68',3005551507, 'nicolasPkP@gmail.com');
END;
/
--Modificar
BEGIN
    PC_CLIENTE.MOD_CLIENTE(1014308690, 'Carlos', 2250185, 'nicolasPkP@gmail.com');
END;
/
--Consultar
SELECT
    PC_CLIENTE.CO_CLIENTE(1014308690)
FROM DUAL;
--Eliminar
BEGIN
    PC_CLIENTE.EL_CLIENTE(1014308690);
END;
/
insert into ubicaciones (direccion, ciudad, departamento) values ('X#-5', 'Pereira', 'Valle');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6253745564, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'X#-5', 3910569397, 'mkl0@moonfruit.com');
insert into sedes (idSede , nombre , ubicacion) values ( 'S170' , 'Estadio Atlantico' , 'X#-5');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E180','A','Carrera de caballos' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('1',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S170' ,  'E180');
--Adicionar
DECLARE
    maxVersion NUMBER;
Begin
    select max(idVersion) into maxVersion 
    from versiones;
    PC_CLIENTE.AD_REGISTRO(maxVersion  , 6253745564 , TO_DATE('2019/12/11' , 'YYYY/MM/DD') , 2300 , 50000);
end;
/
--Consultar
SELECT PC_CLIENTE.CO_REGISTRO( 1 , 6253745564) FROM DUAL;

--Conocer los Eventos Deportivos con más registros en el ultimo mes
SELECT PC_CLIENTE.CO_EVENTOSREGISTROS_ULTIMOMES FROM DUAL;

--Conocer los clientes que más se han registrado en las versiones de los eventos
SELECT PC_CLIENTE.CO_CLIENTES_MASREGISTRADOS FROM DUAL;

--Eliminar
BEGIN
    PC_CLIENTE.EL_REGISTRO(1, 6253745564);
END;
/

                                                            /* OTRAS CONSULTAS */
insert into ubicaciones (direccion, ciudad, departamento) values ('K#54', 'Pereira', 'Norte');                                                            
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (6037119346, 'Maria',TO_DATE('1803/07/17','YYYY/MM/DD'), 'K#54', 9498281152, 'ya9@prweb.com');
insert into sedes (idSede , nombre , ubicacion) values ( 'S540' , 'Estadio Atlantico' , 'K#54');
insert into EventosDeportivos (idEvento,periodicidad,nombre,descripcion) VALUES ( 'E540','A','Carrera de caballos' , 'Muy divertida');
insert into Versiones (idVersion , fechaInicio , fechaFin , sede , evento) VALUES ('1',TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S540' ,  'E540');

--Consultar version por ciudad
SELECT PC_VERSION.CO_VERSION_CIUDAD('Pereira')FROM DUAL;
--Consultar versiones que estan despues de determinada fecha
SELECT PC_VERSION.CO_VERSION_FECHA(TO_DATE('2015/01/03' , 'YYYY/MM/DD') )FROM DUAL;


