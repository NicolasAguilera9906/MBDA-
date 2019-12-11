--UBICACIONES
--No se pueden modificar la direccion de una ubicacion
CREATE OR REPLACE TRIGGER TG_MO_UBICACION
    AFTER UPDATE 
    ON ubicaciones
    FOR EACH ROW
BEGIN
    If :old.direccion != :new.direccion THEN
        Raise_application_error(-20021,'No se pueden modificar la direccion de una ubicacion');
    END IF;
END;
/
--PROVEEDORES
--No se puede modificar el numero de documento de un proveedor
CREATE OR REPLACE TRIGGER TG_MO_PROVEEDOR
    AFTER UPDATE 
    ON proveedores
    FOR EACH ROW
BEGIN
    If :old.documento != :new.documento THEN
        Raise_application_error(-20021,'No se puede cambiar el numero de identificacion de un proveedor');
    END IF;
END;
/
--Solo se pueden eliminar proveedores que no tengan más de 3 compras.
CREATE OR REPLACE TRIGGER TG_EL_PROVEEDOR
    BEFORE DELETE 
    ON proveedores
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    xcompras NUMBER;
BEGIN
    SELECT 
        COUNT(co.proveedor) INTO xcompras
    FROM compras co
    WHERE co.proveedor = :old.documento;
    IF xcompras > 3 THEN
        Raise_application_error(-20021,'El proveedor posee mÃ¡s de 3 compras y no se puede eliminar');
    END IF;
END;
/
--COMPRAS
--El id de la compra se genera automaticamente.
--La fecha de compra debe ser menor a la fecha de envio de su despacho
CREATE OR REPLACE TRIGGER TG_IN_COMPRAS
    BEFORE INSERT
    ON compras
    FOR EACH ROW
DECLARE
    newId NUMBER;
    fechaDespacho DATE;
BEGIN
    SELECT 
        COALESCE(MAX(idCompra),0) into newId
    FROM compras;
    :new.idCompra := newId+1;

    SELECT 
        d.fechaEnvio into fechaDespacho
    FROM despachos d
    WHERE d.idDespacho = :new.despacho;
    IF :new.fechaCompra > fechaDespacho THEN
        Raise_application_error(-20021,'La fecha de compra debe ser menor a la fecha de envio del despacho');
    END IF;
END;
/
--No se puede modificar el identificador de una compra
CREATE OR REPLACE TRIGGER TG_MO_COMPRAS
    BEFORE UPDATE
    ON compras
    FOR EACH ROW
BEGIN
    IF :old.idCompra != :new.idCompra THEN
        Raise_application_error(-20021,'No se puede modificar la informacion de las compras');
    END IF;
END;
/
--Las compras no se pueden eliminar
CREATE OR REPLACE TRIGGER TG_EL_COMPRAS
    BEFORE DELETE
    ON compras
    FOR EACH ROW
BEGIN
    Raise_application_error(-20021,'No se pueden eliminar las compras');
END;
/
--DESPACHOS
--El id de los despachos se genera automaticamente.
--La fecha de envio será una semana despues de la ultima compra realizada.
--La fecha de llegada se establece como nula automaticamente.
CREATE OR REPLACE TRIGGER TG_IN_DESPACHOS
    BEFORE INSERT
    ON despachos
    FOR EACH ROW
DECLARE 
    newId NUMBER;
    fechaActual DATE;
    newFechaEnvio DATE;
BEGIN
    SELECT 
        COALESCE(MAX(d.idDespacho),0) into newId
    FROM despachos d;
    :new.idDespacho := newId+1;

    SELECT 
        sysdate into fechaActual
    FROM dual;
    SELECT 
        COALESCE(MAX(c.fechaCompra),fechaActual) into newFechaEnvio
    FROM compras c
    WHERE :new.idDespacho = c.despacho;
    :new.fechaEnvio := newFechaEnvio + 7;
    :new.fechaLlegada := null;
END;
/
--Solo se puede modificar la fecha de llegada de un despacho.
CREATE OR REPLACE TRIGGER TG_MO_DESPACHOS
    BEFORE UPDATE
    ON despachos
    FOR EACH ROW
BEGIN
    IF :old.idDespacho != :new.idDespacho OR :old.fechaEnvio != :new.fechaEnvio OR :old.bodega != :new.bodega THEN
        Raise_application_error(-20021,'Solo se puede modificar la fecha de llegada de un despacho');
    END IF;
END;
/
--Los despachos no se pueden eliminar
CREATE OR REPLACE TRIGGER TG_EL_DESPACHOS
    BEFORE DELETE
    ON despachos
    FOR EACH ROW
BEGIN
    Raise_application_error(-20021,'Los despachos no se pueden eliminar');
END;
/
-- PRODUCTOS
--Solo se puede modificar el precio y la marca de un producto
CREATE OR REPLACE TRIGGER TG_MO_PRODUCTO
    BEFORE UPDATE
    ON productos
    FOR EACH ROW
BEGIN
    IF :old.idProducto != :new.idProducto OR :old.nombre != :new.nombre OR :old.descripcion != :new.descripcion OR :old.categoria != :new.categoria THEN
        Raise_application_error(-20021,'Solo se pueden modificar la marca y el precio de un producto');
    END IF;
END;
/
--Se puede eliminar un producto si no posee cantidades almacenamientosdas en bodegas
--Se puede eliminar un producto si no ha sido comprado a ningun proveedor
--Se puede eliminar un producto si no se ha pedido por algun cliente
CREATE OR REPLACE TRIGGER TG_EL_PRODUCTO
    BEFORE DELETE
    ON productos
    FOR EACH ROW
DECLARE
    cantidadBodega NUMBER;
    cantidadCompra NUMBER;
    cantidadPedido NUMBER;
BEGIN
    SELECT 
        COUNT(a.cantidad) into cantidadBodega
        FROM almacenamientos a
        WHERE :old.idProducto = a.producto;
    SELECT
        COUNT(p.cantidad) into cantidadCompra
        FROM adquisiciones p
        WHERE :old.idProducto = p.producto;
    SELECT
        COUNT(ed.cantidad) into cantidadPedido
        FROM requerimientos ed
        WHERE :old.idProducto = ed.producto;
    IF cantidadBodega > 0 THEN
        Raise_application_error(-20021,'El producto posee cantidades almacenamientosdas en bodegas');
    END IF;
    IF cantidadPedido > 0 THEN
        Raise_application_error(-20021,'El producto ha sido pedido por algun cliente');
    END IF;
    IF cantidadCompra > 0 THEN
        Raise_application_error(-20021,'El producto ha sido comprado a algun proveedor');
    END IF;
END;
/
-- CATEGORIAS
--No se pueden modificar los datos de una categoria.
CREATE OR REPLACE TRIGGER TG_MO_CATEGORIAS
    BEFORE UPDATE 
    ON categorias
    FOR EACH ROW
BEGIN
    Raise_application_error(-20021,'No se pueden modificar los datos de una categoria');
END;
/
--PEDIDOS
--El ID  de un pedido se genera automaticamente
CREATE OR REPLACE TRIGGER TG_IN_PEDIDOS
    BEFORE INSERT
    ON pedidos
    FOR EACH ROW
DECLARE
    newId NUMBER;
BEGIN
    SELECT 
        COALESCE(MAX(p.idPedido),0) into newId
    FROM pedidos p;
    :new.idPedido := newId+1;
END;
/
-- No se pueden modificar los datos de un pedido
CREATE OR REPLACE TRIGGER TG_MO_PEDIDOS
    BEFORE UPDATE
    ON pedidos
    FOR EACH ROW
BEGIN
    Raise_application_error(-20021,'No se pueden modificar los datos de un pedido');
END;
/
--BODEGAS
--Las bodegas se pueden eliminar si no almacenamientosn productos Y
--si no hay algun despacho pendiente para la bodega.
CREATE OR REPLACE TRIGGER TG_EL_BODEGAS
    BEFORE DELETE
    ON bodegas
    FOR EACH ROW
DECLARE
    cantidadBodega NUMBER;
    despacho NUMBER;
BEGIN
    SELECT 
        SUM(a.cantidad) into cantidadBodega
    FROM almacenamientos a
    WHERE a.bodega = :old.idBodega;
    IF cantidadBodega > 0 THEN
        Raise_application_error(-20021,'La bodega almacenamientos algun producto ');
    END IF;
    SELECT 
        COUNT(d.bodega) into despacho 
    FROM despachos d
    WHERE d.bodega = :old.idBodega;
    IF despacho > 0 THEN
        Raise_application_error(-20021,'La bodega tiene pendiente un despacho');
    END IF;
END;
/
--PAGOS
--El ID se genera automaticamente 
--La fecha pagada se establece como nula automaticamente 
CREATE OR REPLACE TRIGGER TG_IN_PAGOS
    BEFORE INSERT
    ON pagos
    FOR EACH ROW
DECLARE
    newId NUMBER;
BEGIN
    SELECT 
        COALESCE(MAX(idPago),0) into newId
        FROM pagos;
    :new.idPago := newId +1;
    :new.fechaPagada := null;
END;
/
--Solo se puede modificar la fecha pagada 
CREATE OR REPLACE TRIGGER TG_MO_PAGOS
    BEFORE UPDATE
    ON pagos
    FOR EACH ROW
BEGIN
    IF :old.fechaLimite != :new.fechaLimite OR :old.idPago != :new.idPago THEN
        Raise_application_error(-20021,'Solo se puede modificar la fecha pagada');
    END IF;
END;
/
--Se pueden eliminar los pagos si no pagaron y la fecha limite ya pasó
CREATE OR REPLACE TRIGGER TG_EL_PAGOS
    BEFORE DELETE
    ON pagos
    FOR EACH ROW
BEGIN
    IF (:old.fechaLimite < sysdate and :old.fechaPagada is not null) OR (:old.fechaLimite > sysdate) THEN
        Raise_application_error(-20021,'El pago no se puede eliminar porque ya fue pagado');
    END IF;
END;
/
--CLIENTES
--No se puede modificar el documento ni la fecha de nacimiento de un cliente
CREATE OR REPLACE TRIGGER TG_MO_CLIENTES
    BEFORE UPDATE
        ON clientes
        FOR EACH ROW
BEGIN
    IF :old.documento != :new.documento OR :old.fechaNacimiento != :new.fechaNacimiento THEN
        Raise_application_error(-20021,'No se puede modificar el documento ni la fecha de nacimiento de un cliente');
    END IF;
END;
/
--Solo se puede eliminar un cliente si no ha hecho pedidos
CREATE OR REPLACE TRIGGER TG_EL_CLIENTES
    BEFORE DELETE
        ON clientes
        FOR EACH ROW
DECLARE
    numPedidos NUMBER;
BEGIN
    SELECT
        COUNT(pe.cliente) into numPedidos
        FROM pedidos pe
        WHERE pe.cliente = :old.documento;
    IF numPedidos > 0 THEN
        Raise_application_error(-20021,'Solo se puede eliminar un cliente si no ha hecho pedidos');
    END IF;
END;
/
--Solo se pueden modificar la cantidad y el precio de un requerimiento
CREATE OR REPLACE TRIGGER TG_MO_REQUERIMIENTOS
    BEFORE UPDATE
        ON requerimientos
        FOR EACH ROW
BEGIN
    IF :old.pedido != :new.pedido OR :old.producto != :new.producto THEN
        Raise_application_error(-20021,'Solo se pueden modificar la cantidad y el precio de un requerimiento');
    END IF;
END;
/
--Solo se puede eliminar un requerimiento si su cantidad es igual a 0
CREATE OR REPLACE TRIGGER TG_EL_REQUERIMIENTOS
    BEFORE DELETE
        ON requerimientos
        FOR EACH ROW
BEGIN
    IF :old.cantidad > 0 THEN
        Raise_application_error(-20021,'Solo se puede eliminar un requerimiento si su cantidad es igual a 0');
    END IF;
END;
/