--Si se elimina una ubicacion no se eliminan los roles y objetos que posean esa ubicacion
insert into ubicaciones (direccion, ciudad, departamento) values ('PAL24#KMS-2', 'Cincinnati', 'Ohio');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , telefono, correo) values (820435293924167, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'PAL24#KMS-2', 2454644, 'hline0@netscape.com');
DELETE FROM ubicaciones WHERE direccion = 'PAL24#KMS-2';
insert into ubicaciones (direccion, ciudad, departamento) values ('b3#ka-72', 'Denver', 'Colorado');
insert into bodegas (idBodega, ubicacion) values ('KA90', 'b3#ka-72');
DELETE FROM ubicaciones WHERE direccion = 'b3#sh-72';

--Si se elimina una categoria , no se eliminan sus productos.
insert into categorias (idCategoria, nombre, categoria) values ('Q93', 'Streambank Bird', 'O836');
insert into productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('I8461', 'Ewen', 'porttitor id', 3644147642, 'Flowdesk','Q93');
DELETE FROM categorias WHERE idCategoria = 'Q93';

----Cuando un proveedor se elimina no se elimina alguna compra que sea de él.
insert into proveedores (documento, nombre, telefono, correo) values (542464580757303, 'Leen', 8661901153, 'cwogd@yelp.com');
insert into ubicaciones (direccion, ciudad, departamento) values ('b3#sh-72', 'Denver', 'Colorado');
insert into bodegas (idBodega, ubicacion) values ('M319', 'b3#sh-72');
insert into despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (1, TO_DATE('1987/05/01','YYYY/MM/DD'),  TO_DATE('1988/02/01','YYYY/MM/DD'),'M319');
insert into compras (idCompra, fechaCompra, proveedor, despacho) values (1, TO_DATE('1997/01/04','YYYY/MM/DD'), 542464580757303, 1);
DELETE FROM proveedores WHERE documento = '542464580757303';