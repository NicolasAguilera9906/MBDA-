--UBICACIONES
--No se pueden modificar la direccion de una ubicacion
INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('AMA#KMS-2', 'Cincinnati', 'Ohio');
UPDATE ubicaciones SET ciudad='Bogotá' where direccion='AMA#KMS-2';

--PROVEEDORES
--No se puede modificar el numero de documento de un proveedor
INSERT INTO proveedores (documento, nombre, telefono, correo) VALUES (542464580751, 'Leen', 8661901153, 'cwogd@yelp.com');
UPDATE proveedores SET nombre='juan' WHERE documento=542464580751;
UPDATE proveedores SET telefono=2250185 WHERE documento=542464580751;
UPDATE proveedores SET correo='cwodd@yelp.com' where documento=542464580751;
---Solo se pueden eliminar proveedores que no tengan más de 3 compras.
DELETE FROM proveedores WHERE documento = 542464580751;

--COMPRAS
--El id de la compra se genera automaticamente.
--La fecha de compra debe ser menor a la fecha de envio de su despacho
INSERT INTO bodegas (idBodega, ubicacion) VALUES ('M20', 'b3#sh-72');
INSERT INTO despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) VALUES (3, TO_DATE('1987/05/01','YYYY/MM/DD'),  TO_DATE('1988/02/01','YYYY/MM/DD'),'M20');
UPDATE despachos SET fechaLlegada = TO_DATE('2020/05/01','YYYY/MM/DD') WHERE idDespacho = 3;
INSERT INTO proveedores (documento, nombre, telefono, correo) VALUES (54246458075733, 'Leen', 8661901153, 'cwoffgd@yelp.com');
INSERT INTO compras (idCompra, fechaCompra, proveedor, despacho) VALUES (21, TO_DATE('1997/01/04','YYYY/MM/DD'), 54246458075733, 3);
--No se puede modificar el identificador de una compra
UPDATE compras SET despacho = 2 WHERE idCompra = 2;

--DESPACHOS
--El id de los despachos se genera automaticamente.
--La fecha de envio será una semana despues de la ultima compra realizada.
--La fecha de llegada se establece como nula automaticamente.
INSERT INTO despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) VALUES (3, TO_DATE('1987/05/01','YYYY/MM/DD'),  TO_DATE('1988/02/01','YYYY/MM/DD'),'M20');
--Solo se puede modificar la fecha de llegada de un despacho.
UPDATE despachos SET fechaLlegada = TO_DATE('2020/05/01','YYYY/MM/DD') WHERE idDespacho = 3;

-- PRODUCTOS
--Solo se puede modificar el precio y la marca de un producto
INSERT INTO categorias (idCategoria, nombre, categoria) VALUES ('Q92', 'Streambank Bird', null);
INSERT INTO productos (idProducto, nombre, descripcion, precio, marca, categoria) VALUES ('I8469', 'Ewen', 'porttitor id', 3644147642, 'Flowdesk','Q92');
UPDATE productos SET precio = 10000 WHERE idProducto = 'I8469';
UPDATE productos SET marca = 'nike' WHERE idProducto = 'I8469';
--Solo se puede eliminar un producto si no posee cantidades almacenadas en bodegas
DELETE FROM productos WHERE idProducto = 'I8469';


--PEDIDOS
--El ID  de un pedido se genera automaticamente
INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('M24#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) VALUES (814233924167, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'M24#KMS-2', 2454644, 'hlivie0@netscape.com');
INSERT INTO pagos (idPago, fechaLimite, fechaPagada) VALUES (20, TO_DATE('1967/08/01','YYYY/MM/DD'),  TO_DATE('1968/08/01','YYYY/MM/DD'));
INSERT INTO pedidos (idPedido, fecha, cliente, pago) VALUES (20, TO_DATE('1997/02/02','YYYY/MM/DD'), 814233924167, 1);

--BODEGAS
--Las bodegas se pueden eliminar si no almacenan productos Y
--si no hay algun despacho pendiente para la bodega.
INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('G24#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO bodegas (idBodega, ubicacion) VALUES ('G20', 'G24#KMS-2');
DELETE FROM bodegas WHERE idBodega = 'G20';

--PAGOS
--El ID se genera automaticamente 
--La fecha pagada se establece como nula automaticamente
INSERT INTO pagos (idPago, fechaLimite, fechaPagada) VALUES (20, TO_DATE('1967/08/01','YYYY/MM/DD'),  TO_DATE('1968/08/01','YYYY/MM/DD'));
--Solo se puede modificar la fecha pagada 
UPDATE pagos set fechaPagada = TO_DATE('1967/08/01','YYYY/MM/DD') WHERE idPago = 2;

--CLIENTES
--No se puede modificar el documento ni la fecha de nacimiento de un cliente
INSERT INTO ubicaciones (direccion, ciudad, departamento) VALUES ('M25#KMS-2', 'Cincinnati', 'Ohio');
INSERT INTO clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) VALUES (714233924167, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'M25#KMS-2', 2454644, 'hlivie0@netape.com');
UPDATE clientes SET nombres = 'Manuela' WHERE documento = 714233924167;
--Solo se puede eliminar un cliente si no ha hecho pedidos
DELETE FROM  clientes WHERE documento = 714233924167;