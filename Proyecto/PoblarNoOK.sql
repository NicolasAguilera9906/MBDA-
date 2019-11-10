--ubicaciones--
/*
-- CK_UBICACIONES_DIRECCION --
insert into ubicaciones (direccion, ciudad, departamento) values ('b3#====sh-72', 'Denver', 'Colorado');
insert into ubicaciones (direccion, ciudad, departamento) values ('===E1062#foU-', 'Jamaica', 'New York');

-- CK_CLIENTES_DOCUMENTO -- 
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , correo) values (814, 'Herta', TO_DATE('1987/01/01','YYYY/MM/DD'), 'b3#sh-72', 'hlivingstone0@netscape.com');
insert into clientes (documento, nombres, fechaNacimiento, ubicacion , correo) values (8472, 'Jasmin', TO_DATE('1986/03/01','YYYY/MM/DD'), 'E1062#foU-', 'jbasek1@google.es');

-- idPedido NUMBER(5)
insert into pagos (idPedido, fechaLimite, fechaPagada) values (10000000,  TO_DATE('1987/01/01','YYYY/MM/DD'),  TO_DATE('2019/09/20','YYYY/MM/DD'));
insert into pagos (idPedido, fechaLimite, fechaPagada) values (3494945954, TO_DATE('1997/02/01','YYYY/MM/DD'),  TO_DATE('1998/08/01','YYYY/MM/DD'));

-- -- id_pedidos NUMBER(5)
insert into pedidos (id_pedido, fecha, cliente, pago) values (164564574767575567567, TO_DATE('1987/01/01','YYYY/MM/DD'), 814235293924167, 1);
insert into pedidos (id_pedido, fecha, cliente, pago) values (2765756567567557775, TO_DATE('1987/01/01','YYYY/MM/DD'), 845939956235772, 2);

-- CK_CATEGORIAS_ID
insert into categorias (idCategoria, nombre, categoria) values ('C1oo1', 'Tuberous Comfreyi', null);
insert into categorias (idCategoria, nombre, categoria) values ('C5Pk3', 'Prickly Clover', 'V3');

-- FK_PRODUCTOS_CATEGORIA
insert into productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('I8469', 'Ewen', 'porttitor id', 364412, 'Flowdesk','V3');
insert into productos (idProducto, nombre, descripcion, precio, marca, categoria) values ('Y74', 'Lavinie', 'id nisl', 146, 'Asoka', 'X1513');

--CK_PROVEEDORES_CORREO
insert into proveedores (documento, nombre, telefono, correo) values (542464580757306, 'Leenti', 8661901153, 'cwogdon0@yelp.com');
insert into proveedores (documento, nombre, telefono, correo) values (401346238638481, 'Oyoyo', 3436499656, 'kclick1@hud.gov');
*/