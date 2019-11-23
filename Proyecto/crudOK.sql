                                                                /*PC_UBICACION*/
--Adicionar                                                                
Begin
    PC_UBICACION.AD_UBICACION('carrera71bis#68','Bogota','Cundinamarca');
END;
/
--Modificar
Begin
    PC_UBICACION.MOD_UBICACION('carrera71bis#68','Barranquilla','Atlantico');
END;
/
--Consultar
SELECT 
    PC_UBICACION.CO_UBICACION('carrera71bis#68') 
FROM DUAL;
--Eliminar
Begin
    PC_UBICACION.EL_UBICACION('carrera71bis#68');
END;
/
                                                                        /*PC_CLIENTE*/
INSERT INTO ubicaciones values ('carrera71bis#68','Bogota','Cundinamarca');
--Adicionar
BEGIN
    PC_CLIENTE.AD_CLIENTE(1014308690, 'Nicolas', TO_DATE('2000/06/16','YYYY/MM/DD'), 'carrera71bis#68',3005551507, 'nicolasPP@gmail.com');
END;
--Modificar
BEGIN
    PC_CLIENTE.MOD_CLIENTE(1014308690, 'Carlos', 2250185, 'nicolasGG@gmail.com');
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
DELETE FROM ubicaciones WHERE direccion = 'carrera71bis#68';
                                                                        /*PC_PEDIDO*/
/*INSERT INTO ubicaciones values ('carrera71bis#68','Bogota','Cundinamarca');
INSERT INTO clientes values (1014308690, 'Nicolas', TO_DATE('2000/06/16','YYYY/MM/DD'), 'carrera71bis#68',3005551507, 'nicolasPP@gmail.com');
INSERT INTO pagos values ();*/

--Adicionar pago
BEGIN
    PC_PEDIDO.AD_PAGO(TO_DATE('2000/06/16','YYYY/MM/DD'));
END;
/
--Modificar pago
BEGIN
    PC_PEDIDO.MOD_PAGO(1,TO_DATE('2000/06/16','YYYY/MM/DD'));
END;
/
--Consultar pago
SELECT 
    PC_PEDIDO.CO_PAGO(1008)
FROM DUAL;
/
--Eliminar pago
BEGIN
    PC_PEDIDO.EL_PAGO(1008);
END;
/



