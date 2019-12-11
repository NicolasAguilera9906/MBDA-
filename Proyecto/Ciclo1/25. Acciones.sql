--Si se elimina una ubicacion no se eliminan los roles y objetos que posean esa ubicacion
ALTER TABLE bodegas 
DROP CONSTRAINT FK_BODEGAS_UBICACION;
ALTER TABLE bodegas 
ADD CONSTRAINT FK_BODEGAS_UBICACION 
FOREIGN KEY(ubicacion)REFERENCES ubicaciones(direccion) on delete set null;

ALTER TABLE clientes 
DROP CONSTRAINT FK_CLIENTES_UBICACION;
ALTER TABLE clientes 
ADD CONSTRAINT FK_CLIENTES_UBICACION 
FOREIGN KEY(ubicacion)REFERENCES ubicaciones(direccion) on delete set null ;

--Si se elimina una categoria , no se eliminan sus productos.
ALTER TABLE productos 
DROP CONSTRAINT FK_PRODUCTOS_CATEGORIA;
ALTER TABLE productos 
ADD CONSTRAINT FK_PRODUCTOS_CATEGORIA 
FOREIGN KEY(categoria)REFERENCES categorias(idCategoria) on delete set null;


--Si se elimina una categoria , se elimina su subcategoria
ALTER TABLE categorias
ADD CONSTRAINT FK_CATEGORIA_SUBCATEGORIA
FOREIGN KEY(categoria)REFERENCES categorias(idCategoria) on delete cascade;

--Cuando un proveedor se elimina no se elimina alguna compra que sea de él.
ALTER TABLE compras 
DROP CONSTRAINT FK_COMPRAS_PROVEEDOR;
ALTER TABLE compras 
ADD CONSTRAINT FK_COMPRAS_PROVEEDOR 
FOREIGN KEY(proveedor)REFERENCES proveedores(documento) on delete set null;

--Cuando se elimina un pago , se elimina sus pedidos
ALTER TABLE pedidos
DROP CONSTRAINT FK_PEDIDOS_PAGO;
ALTER TABLE pedidos
ADD CONSTRAINT FK_PEDIDOS_PAGO
FOREIGN KEY(pago)REFERENCES pagos(idPago) on delete cascade;

--Cuando se elimina un pedido , se elimina su registro
ALTER TABLE Requerimientos
DROP CONSTRAINT FK_REQUERIMIENTOS_PEDIDO;
ALTER TABLE Requerimientos
ADD CONSTRAINT FK_REQUERIMIENTOS_PEDIDO
FOREIGN KEY(pedido)REFERENCES pedidos(idPedido) on delete cascade;