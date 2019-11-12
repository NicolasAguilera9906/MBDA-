--checks--
ALTER TABLE clientes 
ADD CONSTRAINT CK_CLIENTES_DOCUMENTO 
CHECK(
    documento>999999999
);

ALTER TABLE clientes 
ADD CONSTRAINT CK_CLIENTES_CORREO 
CHECK(
    REGEXP_LIKE (correo,'^[^@]+@[^@]+\.[a-zA-Z]{2,}$')
);


ALTER TABLE requerimientos 
ADD CONSTRAINT CK_requerimientos_PRECIO 
CHECK(
    precio>0
);
ALTER TABLE requerimientos 
ADD CONSTRAINT CK_requerimientos_PRODUCTO 
CHECK(
    producto=UPPER(producto)and REGEXP_LIKE(producto,'^[A-Z0-9]*$')
);


ALTER TABLE productos 
ADD CONSTRAINT CK_PRODUCTOS_PRECIO 
CHECK(
    precio>0 and precio <= 9999999999
);
ALTER TABLE productos 
ADD CONSTRAINT CK_PRODUCTOS_ID 
CHECK(
    idProducto=UPPER(idProducto)and REGEXP_LIKE(idProducto,'^[A-Z0-9]*$')
);
ALTER TABLE productos 
ADD CONSTRAINT CK_PRODUCTOS_CATEGORIA 
CHECK(
    categoria=UPPER(categoria)and REGEXP_LIKE(categoria,'^[A-Z0-9]*$')
);

ALTER TABLE categorias 
ADD CONSTRAINT CK_CATEGORIAS_ID 
CHECK(
    idCategoria=UPPER(idCategoria)and REGEXP_LIKE(idCategoria,'^[A-Z0-9]*$')
);

ALTER TABLE adquisiciones 
ADD CONSTRAINT CK_adquisiciones_PRODUCTO 
CHECK(
    producto=UPPER(producto)and REGEXP_LIKE(producto,'^[A-Z0-9]*$')
);

ALTER TABLE adquisiciones 
ADD CONSTRAINT CK_adquisiciones_PRECIO
CHECK(
    precio>0 and precio <= 9999999999
);

ALTER TABLE compras 
ADD CONSTRAINT CK_COMPRAS_PROVEEDOR 
CHECK(
    proveedor>999999999
);


ALTER TABLE proveedores 
ADD CONSTRAINT CK_PROVEEDORES_DOCUMENTO 
CHECK(
    documento>999999999
);
ALTER TABLE proveedores 
ADD CONSTRAINT CK_PROVEEDORES_CORREO 
CHECK(
    REGEXP_LIKE (correo,'^[^@]+@[^@]+\.[a-zA-Z]{2,}$')
);

ALTER TABLE despachos 
ADD CONSTRAINT CK_DESPACHOS_BODEGA 
CHECK(
    bodega=UPPER(bodega)and REGEXP_LIKE(bodega,'^[A-Z0-9]*$')
);

ALTER TABLE bodegas 
ADD CONSTRAINT CK_BODEGAS_ID 
CHECK(
    idBodega=UPPER(idBodega)and REGEXP_LIKE(idBodega,'^[A-Z0-9]*$')
);

ALTER TABLE almacenamientos 
ADD CONSTRAINT CK_almacenamientos_PRODUCTO 
CHECK(
    producto=UPPER(producto)and REGEXP_LIKE(producto,'^[A-Z0-9]*$')
);
ALTER TABLE almacenamientos 
ADD CONSTRAINT CK_almacenamientos_BODEGA 
CHECK(
    bodega=UPPER(bodega)and REGEXP_LIKE(bodega,'^[A-Z0-9]*$')
);

ALTER TABLE ubicaciones 
ADD CONSTRAINT CK_UBICACIONES_DIRECCION 
CHECK(
    REGEXP_LIKE(direccion,'^[a-zA-Z0-9 #-]*$')
);

