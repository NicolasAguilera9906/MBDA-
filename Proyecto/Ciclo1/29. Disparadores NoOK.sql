--UBICACIONES
--No se pueden modificar la direccion de una ubicacion
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('PAT#KMS-2', 'Cincinnati', 'Ohio');
UPDATE ubicaciones SET direccion='TAP#KMS-2' where direccion='PAT#KMS-2';*/

--PROVEEDORES

--No se puede modificar el numero de documento de un proveedor
/*UPDATE proveedores set documento=11111111111 where documento=542464580751;*/

--Solo se pueden eliminar proveedores que no tengan más de 3 compras.
/*INSERT INTO proveedores (documento, nombre, telefono, correo) VALUES (542464580751, 'Leen', 8661901153, 'cwogd@yelp.com');
INSERT INTO compras (idCompra, fechaCompra, proveedor, despacho) values (2, TO_DATE('1977/01/04','YYYY/MM/DD'), 542464580751, 1);
INSERT INTO compras (idCompra, fechaCompra, proveedor, despacho) values (3, TO_DATE('1977/01/04','YYYY/MM/DD'), 542464580751, 1);
INSERT INTO compras (idCompra, fechaCompra, proveedor, despacho) values (4, TO_DATE('1977/01/04','YYYY/MM/DD'), 542464580751, 1);
INSERT INTO compras (idCompra, fechaCompra, proveedor, despacho) values (5, TO_DATE('1977/01/04','YYYY/MM/DD'), 542464580751, 1);
DELETE FROM proveedores WHERE documento = 542464580751;*/

--COMPRAS

--El id de la compra se genera automaticamente.
--La fecha de compra debe ser menor a la fecha de envio de su despacho
/*insert into compras (idCompra, fechaCompra, proveedor, despacho) values (21, TO_DATE('2020/01/04','YYYY/MM/DD'), 54246458075733, 3);*/

--No se puede modificar el identificador de una compra
/*UPDATE compras set idCompra = 10 WHERE idCompra = 2;*/

--Las compras no se pueden eliminar
/*DELETE FROM compras WHERE idCompra = 2;*/

--DESPACHOS

--Solo se puede modificar la fecha de llegada de un despacho.
/*UPDATE despachos set fechaEnvio = TO_DATE('2020/05/01','YYYY/MM/DD') WHERE idDespacho = 3;*/

--Los despachos no se pueden eliminar--
/*DELETE FROM despachos WHERE idDespacho = 3;*/

-- PRODUCTOS
--Solo se puede modificar el precio y la marca de un producto
/*INSERT INTO categorias (idCategoria, nombre, categoria) values ('Q93', 'Streank Bird', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('I846', 'Ew', 'porttitor id', 3644147642, 'Flowdesk','Q93');
UPDATE productos set nombre = 'balon' WHERE idProducto = 'I846';*/

--Se puede eliminar un producto si no posee cantidades almacenamientosdas en bodegas
/*INSERT INTO categorias (idCategoria, nombre, categoria) values ('F93', 'Streank Bird', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('I846', 'Ew', 'porttitor id', 3644147642, 'Flowdesk','F93');
insert into ubicaciones (direccion, ciudad, departamento) values ('b3#sh-71', 'Denver', 'Colorado');
INSERT INTO bodegas (idBodega, ubicacion) values ('M3', 'b3#sh-71');
INSERT INTO almacenamientos (producto, bodega, cantidad) values ('I846','M3' , 7926539758);
DELETE FROM productos WHERE idProducto = 'I846';*/

--Se puede eliminar un producto si no ha sido comprado a ningun proveedor
/*insert into categorias (idCategoria, nombre, categoria) values ('V3', 'Tuberous Comfrey', null);
insert into productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('J8', 'Cindi', 'quam a odio', 3467063075, 'Stronghold', 'V3');
insert into adquisiciones (producto, compra, cantidad) values ('J8', 1, 808641818);
DELETE FROM productos WHERE idProducto = 'J8';*/

--Se puede eliminar un producto si no ha pedido por algun cliente
/*insert into categorias (idCategoria, nombre, categoria) values ('V5', 'Tuberous Comfrey', null);
insert into productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('J9', 'Cindi', 'quam a odio', 3467063075, 'Stronghold', 'V5');
insert into requerimientos (producto, pedido, cantidad, precio) values ('J9', 1, 238299579, 2335646178);
DELETE FROM productos WHERE idProducto = 'J9';*/

-- CATEGORIAS
--No se pueden modificar los datos de una categoria.
/*INSERT INTO categorias (idCategoria, nombre, categoria) VALUES ('A93', 'Streank Bird', null);
UPDATE categorias set nombre = 'app' WHERE idCategoria = 'A93';*/

--PEDIDOS
-- No se pueden modificar los datos de un pedido
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('M#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) VALUES (814233924168, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'M#KMS-2', 2454644, 'hlivie0@netcape.com');
INSERT INTO pagos (idPago, fechaLimite, fechaPagada) VALUES(20, TO_DATE('1967/08/01','YYYY/MM/DD'),  TO_DATE('1968/08/01','YYYY/MM/DD'));
INSERT INTO pedidos (idPedido, fecha, cliente, pago) VALUES (20, TO_DATE('1997/02/02','YYYY/MM/DD'), 814233924168, 1);
UPDATE pedidos set fecha =  TO_DATE('1993/02/02','YYYY/MM/DD') WHERE idPedido = 1;*/

--No se puede eliminar un pedido
/*DELETE FROM pedidos WHERE idPedido = 1;*/

--BODEGAS
--Las bodegas se pueden eliminar si no almacenamientosn productos
/*INSERT INTO categorias (idCategoria, nombre, categoria) values ('K93', 'Streank Bird', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('I8', 'Ew', 'porttitor id', 3644147642, 'Flowdesk','K93');
INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('T24#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO bodegas (idBodega, ubicacion) VALUES ('F20', 'T24#KMS-2');
insert into almacenamientos (producto, bodega, cantidad) values ('I8','F20' , 7926539758);
DELETE FROM bodegas WHERE idBodega = 'F20';*/

--Las bodegas se pueden eliminar si no tienen pendientes despachos
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('K90#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO bodegas (idBodega, ubicacion) VALUES ('A40', 'K90#KMS-2');
INSERT INTO despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) VALUES (3, TO_DATE('1987/05/01','YYYY/MM/DD'),  TO_DATE('1988/02/01','YYYY/MM/DD'),'A40');
DELETE FROM bodegas WHERE idBodega = 'A40';*/

--PAGOS
--Solo se puede modificar la fecha pagada 
/*UPDATE pagos set fechaLimite = TO_DATE('1897/01/04','YYYY/MM/DD') WHERE idPago = 1;*/
--No se pueden eliminar los pagos
/*DELETE FROM pagos WHERE idPago = 1;*/

--CLIENTES
--No se puede modificar el documento ni la fecha de nacimiento de un cliente
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('M25#KMJ-2', 'Cincinnati', 'Ohio');
INSERT INTO clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) VALUES (514233924167, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'M25#KMJ-2', 2454644, 'hlivie0@tape.com');
UPDATE clientes SET documento = 414233924167 WHERE documento = 514233924167;*/

--Solo se puede eliminar un cliente si no ha hecho pedidos
/*INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('C35#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) VALUES (714233924167, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'C35#KMS-2', 2454644, 'hlhvie0@netape.com');
insert into pagos (idPago, fechaLimite, fechaPagada) values (17,TO_DATE('1932/05/01','YYYY/MM/DD'),  TO_DATE('1933/04/01','YYYY/MM/DD'));
insert into pagos (idPago, fechaLimite, fechaPagada) values (18,TO_DATE('1943/06/01','YYYY/MM/DD'),  TO_DATE('1944/05/01','YYYY/MM/DD'));
insert into pagos (idPago, fechaLimite, fechaPagada) values (19,TO_DATE('1934/07/01','YYYY/MM/DD'),  TO_DATE('1935/07/01','YYYY/MM/DD'));
insert into pagos (idPago, fechaLimite, fechaPagada) values (20, TO_DATE('1967/08/01','YYYY/MM/DD'),  TO_DATE('1968/08/01','YYYY/MM/DD'));
insert into pedidos (idPedido, fecha, cliente, pago) values (1, TO_DATE('1997/02/02','YYYY/MM/DD'), 714233924167, 1);
insert into pedidos (idPedido, fecha, cliente, pago) values (2, TO_DATE('1967/03/03','YYYY/MM/DD'), 714233924167, 2);
insert into pedidos (idPedido, fecha, cliente, pago) values (3, TO_DATE('1957/04/04','YYYY/MM/DD'), 714233924167, 3);
insert into pedidos (idPedido, fecha, cliente, pago) values (4, TO_DATE('1947/05/05','YYYY/MM/DD'), 714233924167, 4);
DELETE FROM clientes WHERE documento = 714233924167;*/