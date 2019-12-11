DELETE FROM requerimientos;
DELETE FROM pedidos;
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
    PC_CLIENTE.AD_CLIENTE(1014308690, 'Nicolas', TO_DATE('2000/06/16','YYYY/MM/DD'), 'carrera71bis#68',3005551507, 'nicolasPkP@gmail.com');
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
DELETE FROM ubicaciones WHERE direccion = 'carrera71bis#68';
                                                                        /*PC_PEDIDO*/


--Adicionar pago
BEGIN
    PC_PEDIDO.AD_PAGO(TO_DATE('2000/06/16','YYYY/MM/DD'));
END;
/

--Modificar pago
BEGIN
    PC_PEDIDO.MOD_PAGO(1,null);
END;
/

--Consultar pago
SELECT 
    PC_PEDIDO.CO_PAGO(1)
FROM DUAL;
/

--Eliminar pago
BEGIN
    PC_PEDIDO.EL_PAGO(1);
END;
/

INSERT INTO ubicaciones values ('carrera71is#68','Bogota','Cundinamarca');
INSERT INTO clientes values (1014308700, 'Nicolas', TO_DATE('2000/06/16','YYYY/MM/DD'), 'carrera71is#68',3005551507, 'na@gmail.com');
INSERT INTO pagos (fechaLimite) values (TO_DATE('2000/06/16','YYYY/MM/DD'));
--Adicionar Pedido
BEGIN
    PC_PEDIDO.AD_PEDIDO(TO_DATE('1900/06/10','YYYY/MM/DD'), 1014308700 , 5);
END;
/

--Consultar Pedido
SELECT PC_PEDIDO.CO_PEDIDO(1) FROM DUAL;

-- Eliminar Pedido
BEGIN
    PC_PEDIDO.EL_PEDIDO(1);
END;
/

DELETE FROM ubicaciones WHERE direccion = 'carrera71is#68';
DELETE FROM pedidos WHERE idPedido = (SELECT MAX(idPedido) FROM pedidos);
DELETE FROM clientes WHERE documento = 1014308700;
--Añadir Requerimiento
INSERT INTO ubicaciones values ('carrera98','Bogota','Cundinamarca');
INSERT INTO clientes values (1014308800, 'Juan', TO_DATE('2019/11/16','YYYY/MM/DD'), 'carrera98',3005551507, 'kapa@gmail.com');
INSERT INTO pagos (fechaLimite,fechaPagada) values (TO_DATE('2019/11/16','YYYY/MM/DD'),TO_DATE('2019/11/16','YYYY/MM/DD'));
INSERT INTO pedidos (idPedido ,fecha , cliente , pago) VALUES (1,TO_DATE('2019/11/10','YYYY/MM/DD'), 1014308800 , 2);
INSERT INTO categorias (idCategoria, nombre, categoria) values ('CK001', 'Randene', null);
INSERT INTO productos  (idProducto, nombre, descripcion, precio, marca, categoria) values ('PK001', 'Allix', 'Mady', 371211342, 'NoÃ«lla', 'CK001');
BEGIN
    PC_PEDIDO.AD_REQUERIMIENTO('PK001',1,100,10);
END;
/

--Modificar Requerimiento
BEGIN
    PC_PEDIDO.MO_REQUERIMIENTO('PK001',1,0,10);
END;
/

--Consultar Requerimiento

SELECT PC_PEDIDO.CO_REQUERIMIENTO('PK001',1) FROM DUAL;

--Consultar el detalle de los pagos
SELECT PC_PEDIDO.CO_DETALLES_PAGOS FROM DUAL;

--Eliminar Requerimientos
BEGIN
    PC_PEDIDO.EL_REQUERIMIENTO('PK001',1);
END;
/

                                                                /* PC_PRODUCTO */
-- Insertar en Productos
INSERT INTO categorias (idCategoria, nombre, categoria) values ('KAPA1', 'Randene', null);
BEGIN
    PC_PRODUCTO.AD_PRODUCTO('PRFF0' ,'zapatp' ,'Bonito' ,10,'Nike','KAPA1');
END;
/

--Modificar en productos
BEGIN
    PC_PRODUCTO.MO_PRODUCTO('PRFF0', 30000, 'Adidas');
END;
/

--Consultar producto
SELECT PC_PRODUCTO.CO_PRODUCTO('PRFF0') FROM DUAL;

--Consultar Productos Vendidos
INSERT INTO ubicaciones values ('carrera bis','Bogota','Cundinamarca');
INSERT INTO clientes values (1014308500, 'Juan', TO_DATE('2019/11/16','YYYY/MM/DD'), 'carrera bis',3005551507, 'ka@gmail.com');
INSERT INTO pagos (fechaLimite,fechaPagada) values (TO_DATE('2019/11/16','YYYY/MM/DD'),TO_DATE('2019/11/16','YYYY/MM/DD'));
INSERT INTO pedidos (idPedido ,fecha , cliente , pago) VALUES (1,TO_DATE('2019/11/10','YYYY/MM/DD'), 1014308500 , 2);
INSERT INTO requerimientos (producto , pedido , cantidad , precio) VALUES ('PRFF0',(SELECT MAX(ROWNUM) FROM pedidos) ,100,10);
SELECT PC_PRODUCTO.CO_PRODUCTOS_VENDIDOS FROM DUAL;

--Consultar informacion de los productos
INSERT INTO ubicaciones values ('elguali','Bogota','Cundinamarca');
insert into bodegas (idBodega, ubicacion) values ('BO001', 'elguali');
insert into despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (1, TO_DATE('1969/05/04','YYYY/MM/DD'),TO_DATE('1895/03/02','YYYY/MM/DD'),'BO001');
insert into proveedores (documento, nombre, telefono, correo) values (1014698547, 'Nita', 3103269941, 'mlop@moonfruit.com');
insert into compras (idCompra, fechaCompra, proveedor, despacho) values (1, TO_DATE('1874/11/22','YYYY/MM/DD'),1014698547, 1);
insert into adquisiciones (producto, compra, cantidad , precio) values ('PRFF0', (SELECT MAX(ROWNUM) FROM compras), 59613,50000);
SELECT PC_PRODUCTO.CO_INFO_PRODUCTOS FROM DUAL;

--Consultar producto por marca
SELECT PC_PRODUCTO.CO_PRODUCTOS_MARCA('Adidas') FROM DUAL;

--Consultar producto por precio
SELECT PC_PRODUCTO.CO_PRODUCTOS_PRECIO(30000) FROM DUAL;

--Consultar producto por categoria
SELECT PC_PRODUCTO. CO_PRODUCTOS_CATEGORIA('KAPA1') FROM DUAL;

--Eliminar producto
UPDATE requerimientos set cantidad = 0 WHERE pedido = (SELECT MAX(ROWNUM) FROM pedidos) and producto = 'PRFF0';
DELETE FROM requerimientos WHERE pedido = (SELECT MAX(ROWNUM) FROM pedidos) and producto = 'PRFF0';
DELETE FROM pedidos WHERE idPedido = (SELECT MAX(ROWNUM) FROM pedidos);
DELETE FROM pagos WHERE idPago = (SELECT MAX(ROWNUM) FROM pagos);
BEGIN
    PC_PRODUCTO.EL_PRODUCTO('PRFF0');
END;
/

                                                                 /* PC_CATEGORIA */
--Insertar en categorias                            
BEGIN
    PC_CATEGORIA.AD_CATEGORIA('CP001','balones',null);
END;
/

--Consultar categoria
SELECT  PC_CATEGORIA.CO_CATEGORIA('CP001') FROM DUAL;

--Eliminar categoria
BEGIN
    PC_CATEGORIA.EL_CATEGORIA('CP001');
END;
/
                                                                    /* PC_COMPRA */
--Insertar compra
INSERT INTO ubicaciones values ('euripa#54','Bogota','Cundinamarca');
insert into bodegas (idBodega, ubicacion) values ('BO002', 'euripa#54');
insert into despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (1, TO_DATE('1969/05/04','YYYY/MM/DD'),TO_DATE('1895/03/02','YYYY/MM/DD'),'BO002');                                                                    
INSERT INTO proveedores (documento, nombre, telefono, correo) VALUES (1014789654 , 'nike' , 2250185 , 'nikeCo@gmail.com');
BEGIN
    PC_COMPRA.AD_COMPRA(TO_DATE('1895/03/02','YYYY/MM/DD'),1014789654,1);
END;
/

--Insertar adquisicion
INSERT INTO categorias (idCategoria, nombre, categoria) values ('TAPA1', 'Randene', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) VALUES('PRKK1' ,'zapatp' ,'Bonito' ,10,'Nike','TAPA1');
BEGIN
    PC_COMPRA.AD_ADQUISICION( 'PRKK1' , 1, 20, 30);
END;
/

--Modificar adquisicion
BEGIN
    PC_COMPRA.MO_ADQUISICION( 'PRKK1' , 1, 20, 30);
END;
/

--Consultar adquisicion
SELECT PC_COMPRA.CO_ADQUISICION('PRKK1' , 1) FROM DUAL;

--Eliminar adquisicion
BEGIN
    PC_COMPRA.EL_ADQUISICION('PRKK1' , 1);
END;
/

--Insertar despacho
INSERT INTO ubicaciones values ('kennedy#54','Bogota','Cundinamarca');
insert into bodegas (idBodega, ubicacion) values ('BO003', 'kennedy#54');
BEGIN
    PC_COMPRA.AD_DESPACHO('BO003');
END;
/

--Modificar despacho
BEGIN
    PC_COMPRA.MO_DESPACHO(1,TO_DATE('2000/05/04','YYYY/MM/DD'));
END;
/

--Consultar despacho
SELECT PC_COMPRA.CO_DESPACHO(1) FROM DUAL;

--Consultar detalles de las compras
INSERT INTO ADQUISICIONES VALUES ('PRKK1', (SELECT MAX(ROWNUM) FROM compras) , 20, 30);
SELECT PC_COMPRA.CO_DETALLE_COMPRAS FROM DUAL;

--Consultar los despachos ordenados por tiempo de llegada
INSERT INTO ubicaciones values ('bosa#54','Bogota','Cundinamarca');
INSERT INTO bodegas (idBodega, ubicacion) values ('BO004', 'bosa#54');
INSERT INTO despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (1, TO_DATE('1969/05/04','YYYY/MM/DD'),TO_DATE('1895/03/02','YYYY/MM/DD'),'BO004');
SELECT PC_COMPRA.CO_TIEMPO_DESPACHOS FROM DUAL;

--Consultar los despachos por estado de llegada
UPDATE despachos set fechaLlegada = TO_DATE('2000/05/04','YYYY/MM/DD') where idDespacho = 1;
SELECT PC_COMPRA.CO_DESPACHOS_ESTADOLLEGADA('No entregado') FROM DUAL;

                                                            /* PC_PROVEEDOR */
-- Adicionar proveedor                                                            
BEGIN
    PC_PROVEEDOR.AD_PROVEEDOR(10147658394,'Puma',7484857544,'puma@pumaCo.com');
END;
/
--Modificar proveedor
BEGIN
    PC_PROVEEDOR.MO_PROVEEDOR(10147658394,'Rebook',7464567544,'rebookCO@co.com');
END;
/
--Consultar proveedor
SELECT PC_PROVEEDOR.CO_PROVEEDOR(10147658394) FROM DUAL;

--Consultar las cantidades vendiadas pro los proveedores
INSERT INTO ubicaciones values ('suba#54','Bogota','Cundinamarca');
INSERT INTO bodegas (idBodega, ubicacion) values ('BO007', 'suba#54');
INSERT INTO despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (1, TO_DATE('1969/05/04','YYYY/MM/DD'),TO_DATE('1895/03/02','YYYY/MM/DD'),'BO007');                                                                    
INSERT INTO compras VALUES (1,TO_DATE('1895/03/02','YYYY/MM/DD'),10147658394,1);
INSERT INTO categorias (idCategoria, nombre, categoria) values ('CA010', 'Randene', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) VALUES ('PRPP1' ,'tennis' ,'Bonito' ,10,'Puma','CA010');
INSERT INTO adquisiciones VALUES ('PRPP1' , (SELECT MAX(ROWNUM) FROM compras) , 20, 30);
SELECT PC_PROVEEDOR.CO_INFO_COMPRASPROVEEDORES FROM DUAL;

--Eliminar proveedor
BEGIN
    PC_PROVEEDOR.EL_PROVEEDOR(10147658394);
END;
/

                                                                /*PC_BODEGA*/
--Adicionar bodega
INSERT INTO ubicaciones values ('bunidos#54','Bogota','Cundinamarca');
BEGIN
    PC_BODEGA.AD_BODEGA('BC001','bunidos#54');
END;
/

--Consultar bodega
SELECT PC_BODEGA.CO_BODEGA('BC001') FROM DUAL;

--Eliminar bodegas
BEGIN
    PC_BODEGA.EL_BODEGA('BC001');
END;
/

--Añadir Almacenamiento
INSERT INTO categorias VALUES ('CA011', 'Randene', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) VALUES('PPKK1' ,'tennis' ,'Bonito' ,10,'Puma','CA011');
INSERT INTO ubicaciones values ('bus#54','Bogota','Cundinamarca');
INSERT INTO bodegas (idBodega, ubicacion) values ('BKT09', 'bus#54');
BEGIN
    PC_BODEGA.AD_ALMACENAMIENTO('PPKK1','BKT09' , 100);
END;
/
--Modificar Almacenamiento
BEGIN
    PC_BODEGA.MOD_ALMACENAMIENTO('PPKK1','BC001' , 50);
END;
/
-- Consultar almacenamiento
SELECT PC_BODEGA.CO_ALMACENAMIENTO('PPKK1','BC001') FROM DUAL;

--Eliminar almacenamiento
BEGIN
    PC_BODEGA.EL_ALMACENAMIENTO('PPKK1','BC001');
END;
/

--Consultar capacidad almacenada de las bodegas
INSERT INTO ubicaciones values ('bpopular#54','Bogota','Cundinamarca');
INSERT INTO bodegas (idBodega, ubicacion) values ('B15OK', 'bpopular#54');
INSERT INTO despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (1, TO_DATE('1969/05/04','YYYY/MM/DD'),TO_DATE('1895/03/02','YYYY/MM/DD'),'B15OK');           
INSERT INTO proveedores (documento, nombre, telefono, correo) VALUES (1014789900 , 'balance' , 2250185 , 'balance@gmail.com');
INSERT INTO compras VALUES (1,TO_DATE('1895/03/02','YYYY/MM/DD'),1014789900,(SELECT MAX(ROWNUM) FROM despachos));
INSERT INTO categorias (idCategoria, nombre, categoria) values ('CA020', 'Randene', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) VALUES ('PRPP2' ,'tennis' ,'Bonito' ,10,'Puma','CA020');
INSERT INTO adquisiciones VALUES ('PRPP2' , (SELECT MAX(ROWNUM) FROM compras) , 20, 30);
SELECT PC_BODEGA.CO_CAPACIDAD_BODEGAS FROM DUAL;

--Numero de despachos recibidos por esa bodega
SELECT PC_BODEGA.CO_DESPACHOSBODEGA('B15OK') FROM DUAL;
