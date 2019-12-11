-- Correo Invalido
/*INSERT INTO ubicaciones values ('carrer65#68','Bogota','Cundinamarca');
--Adicionar
BEGIN
    PC_CLIENTE.AD_CLIENTE(1014308766, 'Nicolas', TO_DATE('2000/06/16','YYYY/MM/DD'), 'carrer65#68',3005551507, 'nicasPkP@gmail.com');
END;
/
--Modificar
BEGIN
    PC_CLIENTE.MOD_CLIENTE(1014308766, 'Nicolas', 2250185, 'nicolasPkPgmail.com');
END;
/*/

--Ubicacion no existente
/*BEGIN
    PC_SEDE.AD_SEDE( 'S0051' , 'Estadio Atlantico' , 'carrera#98');
END;
/*/

--Evento y Sede Inexistente
/*BEGIN
    AD_VERSION(TO_DATE('2000/06/16','YYYY/MM/DD'), TO_DATE('2007/06/16','YYYY/MM/DD'), 'S170', 'E190');
END;*/
