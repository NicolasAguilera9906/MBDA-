--FKS--
ALTER TABLE clientes 
ADD CONSTRAINT FK_CLIENTES_UBICACION 
FOREIGN KEY(ubicacion)REFERENCES ubicaciones(direccion);

ALTER TABLE pedidos 
ADD CONSTRAINT FK_PEDIDOS_CLIENTE 
FOREIGN KEY(cliente)REFERENCES clientes(documento) ;

ALTER TABLE pedidos 
ADD CONSTRAINT FK_PEDIDOS_PAGO 
FOREIGN KEY(pago)REFERENCES pagos(idPago);

ALTER TABLE requerimientos 
ADD CONSTRAINT FK_requerimientos_PRODUCTO 
FOREIGN KEY(producto)REFERENCES productos(idProducto);

ALTER TABLE requerimientos 
ADD CONSTRAINT FK_requerimientos_PEDIDO 
FOREIGN KEY(pedido)REFERENCES pedidos(idPedido);

ALTER TABLE productos 
ADD CONSTRAINT FK_PRODUCTOS_CATEGORIA 
FOREIGN KEY(categoria)REFERENCES categorias(idCategoria);

ALTER TABLE adquisiciones 
ADD CONSTRAINT FK_adquisiciones_PRODUCTO 
FOREIGN KEY(producto)REFERENCES productos(idProducto);

ALTER TABLE adquisiciones 
ADD CONSTRAINT FK_adquisiciones_COMPRA 
FOREIGN KEY(compra)REFERENCES compras(idCompra);

ALTER TABLE compras 
ADD CONSTRAINT FK_COMPRAS_PROVEEDOR 
FOREIGN KEY(proveedor)REFERENCES proveedores(documento);

ALTER TABLE compras 
ADD CONSTRAINT FK_COMPRAS_DESPACHO 
FOREIGN KEY(despacho)REFERENCES despachos(idDespacho) ;

ALTER TABLE despachos 
ADD CONSTRAINT FK_DESPACHOS_BODEGA 
FOREIGN KEY(bodega)REFERENCES bodegas(idBodega) ;

ALTER TABLE bodegas 
ADD CONSTRAINT FK_BODEGAS_UBICACION 
FOREIGN KEY(ubicacion)REFERENCES ubicaciones(direccion);

ALTER TABLE almacenamientos 
ADD CONSTRAINT FK_almacenamientos_BODEGA 
FOREIGN KEY(bodega)REFERENCES bodegas(idBodega);

ALTER TABLE almacenamientos 
ADD CONSTRAINT FK_almacenamientos_PRODUCTO 
FOREIGN KEY(producto)REFERENCES productos(idProducto);
