--vistas


Create view Info_Productos AS
    SELECT 
        p.nombre,
        p.descripcion,
        p.marca,
        p.categoria,
        p.precio as precioActual,
        a.precio as precioCompra 
    FROM productos p , adquisiciones a , compras c
    WHERE a.compra = c.idCompra 
        AND p.idProducto = a.producto
        AND c.fechaCompra = (
            SELECT 
                min(cc.fechaCompra)
            FROM compras cc , adquisiciones aa
            WHERE cc.idCompra = aa.compra
                AND aa.producto = a.producto);
/

Create view Productos_vendidos AS
   SELECT 
        po.nombre as nombreProducto,
        sum(cantidad) as cantidad
    FROM pagos pa,pedidos pe,requerimientos d,productos po
    WHERE pe.pago=pa.idPago 
        AND d.pedido=pe.idPedido 
        AND d.producto=po.idProducto 
        AND fechaPagada <= sysdate 
        AND fechaPagada >= ADD_MONTHS(sysdate,-1)
        AND fechaPagada is not null
    GROUP BY  po.nombre
    ORDER BY  cantidad;
/

Create view Info_Bodegas AS
    SELECT 
        b.idBodega,
        u.direccion,
        u.departamento,
        u.ciudad,
        sum(p.cantidad) as cantidad_almacenada
    FROM bodegas b , despachos d , compras c , adquisiciones p , ubicaciones u
    WHERE b.idBodega = d.bodega 
    AND c.despacho = d.idDespacho 
    AND c.idCompra = p.compra 
    AND u.direccion = b.ubicacion
    GROUP BY b.idBodega , u.direccion, u.departamento, u.ciudad
    ORDER BY cantidad_almacenada;
/

Create view Detalles_pagos as
    SELECT
        pa.idPago,
        p.fecha as fechaPedido ,
        pa.fechaLimite, 
        pa.fechaPagada,
        sum(r.cantidad) as cantidad_productos,
        sum(r.precio) precio_a_pagar
    FROM pagos pa , pedidos p , requerimientos r , productos p
    WHERE p.pago = pa.idPago
        AND r.pedido = p.idPedido
        AND r.producto = p.idProducto
        AND pa.fechaPagada is not null
        AND pa.fechaPagada <= sysdate 
        AND pa.fechaPagada >= ADD_MONTHS(sysdate,-1)
    GROUP BY pa.idPago , p.fecha , pa.fechaLimite , pa.fechaPagada;
/

Create view Detalles_Compras as
    SELECT
    c.idCompra,
    c.fechaCompra,
    c.proveedor,
    sum(a.cantidad) as cantidad_productos,
    sum(a.precio) precio_total_compra
    FROM compras c , proveedores p , adquisiciones a
    WHERE c.proveedor = p.documento
        AND a.compra = c.idCompra 
        AND c.fechaCompra <= sysdate 
        AND c.fechaCompra >= ADD_MONTHS(sysdate,-1)
    GROUP BY c.idCompra , c.fechaCompra , c.proveedor
    ORDER BY cantidad_productos , precio_total_compra;
/
Create view Info_proveedores as
   SELECT 
        po.nombre as nombreProveedor ,
        sum(cantidad) as cantidad
    FROM proveedores po , compras c , adquisiciones p 
    WHERE po.documento = c.proveedor 
        AND c.idCompra = p.compra 
        AND c.fechaCompra <= sysdate 
        AND c.fechaCompra >= ADD_MONTHS(sysdate,-1)
    GROUP BY po.nombre
    ORDER BY cantidad;
/