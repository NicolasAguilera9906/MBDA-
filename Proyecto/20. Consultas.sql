                                                    /* CONSULTAS OPERATIVAS */
-- Conocer la información de los Productos --
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
            
-- Conocer los productos por marca --
SELECT 
    p.nombre,
    p.marca
FROM productos p
ORDER BY marca;

-- Conocer los productos por precio --
SELECT 
    p.nombre,
    p.precio
FROM productos p
ORDER BY p.precio;

-- Conocer los productos por categoria --
SELECT 
    p.nombre,
    p.categoria
FROM productos p
ORDER BY p.categoria;

--Conocer el tiempo demorado de  los despachos realizados este mes 
SELECT 
    d.fechaEnvio,
    d.fechaLlegada,
    u.direccion,
    u.ciudad,
    u.departamento
FROM despachos d , bodegas b , ubicaciones u
WHERE d.bodega = b.idBodega 
    AND b.ubicacion = u.direccion
    AND d.fechaEnvio <= sysdate 
    AND d.fechaEnvio >= ADD_MONTHS(sysdate,-1)
ORDER BY fechaLlegada - fechaEnvio DESC;

--Conocer los despachos por su estado de llegada
SELECT 
    u.direccion,
    u.ciudad,
    u.departamento,
    d.fechaEnvio,
    d.fechaLlegada,
    CASE
        WHEN d.fechaLlegada is not null THEN 'Entregado'
        ELSE 'No entregado'
    END AS estado
FROM despachos d , bodegas b , ubicaciones u
WHERE d.bodega = b.idBodega 
    AND b.ubicacion = u.direccion;

--Conocer la informacion de las bodegas
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

--Conocer las bodegas que mas despachos recibieron en el ultimo mes
SELECT 
    b.idBodega,
    b.ubicacion,
    u.ciudad,
    u.departamento,
    count(d.idDespacho) as num_despachos
FROM bodegas b , despachos d , ubicaciones u
WHERE b.idBodega = d.bodega
    AND b.ubicacion = u.direccion
    AND d.fechaEnvio <= sysdate 
    AND d.fechaEnvio >= ADD_MONTHS(sysdate,-1)
GROUP BY b.idBodega , b.ubicacion , u.ciudad,u.departamento
ORDER BY num_despachos DESC;

                                                    /* CONSULTAS GERENCIALES */
                                                    
--Conocer el detalle de los pagos recibidos este mes--
SELECT
    pa.idPago,
    p.fecha,
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

--Conocer el detalle de las compras de este mes
SELECT
    c.idCompra , c.fechaCompra , c.proveedor , sum(a.cantidad) as cantidad_productos  , sum(a.precio) precio_total_compra
FROM compras c , proveedores p , adquisiciones a
WHERE c.proveedor = p.documento
    AND a.compra = c.idCompra 
    AND c.fechaCompra <= sysdate 
    AND c.fechaCompra >= ADD_MONTHS(sysdate,-1)
GROUP BY c.idCompra , c.fechaCompra , c.proveedor
ORDER BY cantidad_productos , precio_total_compra;

--Conocer los productos más vendidos de este mes--
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


-- Conocer los proveedores qué más cantidades han vendido 
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
