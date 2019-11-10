--Conocer los producto vendidos en el ultimo mes--

SELECT 
    po.nombre as nombreProducto,
    sum(cantidad) as cantidad
FROM pagos pa,pedidos pe,requerimientos d,productos po
WHERE pe.pago=pa.idPago 
AND d.pedido=pe.idPedido 
AND d.producto=po.idProducto 
AND fechaPagada <= (
    SELECT 
        sysdate
        FROM dual) 
AND fechaPagada >= (
    SELECT sysdate-31 
    FROM dual)
GROUP BY  po.nombre;

--Conocer los productos que contiene cada una de las bodegas

SELECT 
    pr.nombre as nombreProducto ,
    b.idBodega,
    u.direccion,
    u.departamento,
    u.ciudad,
    sum(cantidad) as cantidad
FROM bodegas b , despachos d , compras c , adquisiciones p , productos pr , ubicaciones u
WHERE b.idBodega = d.bodega 
AND c.despacho = d.idDespacho 
AND c.idCompra = p.compra 
AND p.producto = pr.idProducto 
AND u.direccion = b.ubicacion
GROUP BY pr.nombre,b.idBodega,u.direccion,u.departamento,u.ciudad
ORDER BY cantidad;

-- Conocer los productos que han vendido los proveedores

SELECT 
    po.nombre as nombreProveedor ,
    pr.nombre as nombreProducto ,
    sum(cantidad) as cantidad
FROM proveedores po , compras c , adquisiciones p , productos pr 
WHERE po.documento = c.proveedor 
AND c.idCompra = p.compra 
AND p.producto = pr.idProducto 
GROUP BY po.nombre,pr.nombre
ORDER BY cantidad;

-- Conocer los despachos más demorados en llegar a una bodega

SELECT 
    d.fechaEnvio,
    d.fechaLlegada,
    u.direccion,
    u.ciudad,
    u.departamento
FROM despachos d , bodegas b , ubicaciones u
WHERE d.bodega = b.idBodega 
AND b.ubicacion = u.direccion
ORDER BY fechaLlegada - fechaEnvio DESC;