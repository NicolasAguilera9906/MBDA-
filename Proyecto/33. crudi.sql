                                                                    /*PC_UBICACION*/
CREATE OR REPLACE PACKAGE BODY PC_UBICACION IS
	PROCEDURE AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2) IS
	BEGIN
		INSERT INTO ubicaciones (direccion ,ciudad ,departamento) VALUES (Xdireccion, Xciudad , Xdepartamento);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en ubicacion');
	END;
    PROCEDURE MOD_UBICACION(Xdireccion IN varchar2 , Xciudad IN varchar2, Xdepartamento IN varchar2) IS
	BEGIN
		UPDATE ubicaciones SET ciudad=Xciudad ,departamento=Xdepartamento WHERE direccion = Xdireccion;
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al modificar en ubicacion');
	END;
    PROCEDURE EL_UBICACION(Xdireccion IN varchar2) IS
	BEGIN 
		DELETE FROM ubicaciones  WHERE(direccion=Xdireccion);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20003,'Error al eliminar en ubicacion');
	END;
    FUNCTION CO_UBICACION(Xdireccion IN varchar2) RETURN SYS_REFCURSOR IS UBICACIONES SYS_REFCURSOR;
	BEGIN 
		OPEN UBICACIONES FOR
			SELECT 
                *
            FROM ubicaciones u
            WHERE Xdireccion = u.direccion;
		RETURN UBICACIONES;
	END;
END PC_UBICACION;            
/

                                                                    /*PC_CLIENTE*/
CREATE OR REPLACE PACKAGE BODY PC_CLIENTE IS
	PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
		INSERT INTO clientes (documento ,nombres ,fechaNacimiento ,ubicacion ,telefono ,correo ) VALUES (Xdocumento , Xnombres , XfechaNacimiento ,Xubicacion, Xtelefono , Xcorreo );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en clientes');
	END;
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
		UPDATE clientes SET nombres = Xnombres , telefono = Xtelefono , correo = Xcorreo  WHERE documento = Xdocumento;
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al modificar en clientes');
	END;
    PROCEDURE EL_CLIENTE(Xdocumento IN number) IS
	BEGIN
		DELETE FROM clientes  WHERE(documento=Xdocumento);
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al eliminar en clientes');
	END;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR IS CLIENTE SYS_REFCURSOR;
	BEGIN 
		OPEN CLIENTE FOR
			SELECT 
                *
            FROM clientes c
            WHERE Xdocumento = c.documento;
		RETURN CLIENTE;
	END;
END PC_CLIENTE;            
/
                                                                    /*PC_PEDIDO*/
CREATE OR REPLACE PACKAGE BODY PC_PEDIDO IS
	PROCEDURE AD_PAGO(XfechaLimite IN date) IS
	BEGIN
		INSERT INTO pagos (fechaLimite) VALUES (XfechaLimite);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en pagos');
	END;
    PROCEDURE MOD_PAGO(XidPago IN number, XfechaPagada IN date) IS
	BEGIN
		UPDATE pagos SET fechaPagada = XfechaPagada WHERE idPago = XidPago;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en pagos');
	END;
    PROCEDURE EL_PAGO(XidPago IN number) IS
	BEGIN
		DELETE FROM pagos WHERE idPago = XidPago;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en pagos');
	END;
    FUNCTION CO_PAGO(XidPago IN number) RETURN SYS_REFCURSOR IS PAGO SYS_REFCURSOR;
	BEGIN 
		OPEN PAGO FOR
			SELECT 
                *
            FROM pagos p
            WHERE XidPago = idPago;
		RETURN PAGO;
	END;
    PROCEDURE AD_PEDIDO(Xfecha IN date, Xcliente IN number , Xpago IN number) IS
	BEGIN
		INSERT INTO pedidos (fecha ,cliente, pago ) values ( Xfecha , Xcliente , Xpago);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en pedidos');
	END;
    PROCEDURE EL_PEDIDO(XidPedido IN number) IS
	BEGIN
		DELETE FROM pedidos WHERE idPedido = XidPedido;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en pedidos');
	END;
    FUNCTION CO_PEDIDO(XidPedido IN number) RETURN SYS_REFCURSOR IS PEDIDO SYS_REFCURSOR;
	BEGIN 
		OPEN PEDIDO FOR
			SELECT 
                *
            FROM pedidos pe
            WHERE XidPedido = idPedido;
		RETURN PEDIDO;
	END;
    PROCEDURE AD_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number, Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		INSERT INTO requerimientos(producto,pedido,cantidad,precio) VALUES (  Xproducto , Xpedido , Xcantidad , Xprecio );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en requerimientos');
	END;
    PROCEDURE MO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number, Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		UPDATE requerimientos SET cantidad = Xcantidad,precio=Xprecio WHERE producto = Xproducto AND pedido = Xpedido;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en requerimientos');
	END;
    PROCEDURE EL_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number) IS
	BEGIN
		DELETE FROM requerimientos WHERE producto = Xproducto AND pedido = Xpedido;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en requerimientos');
	END;
    FUNCTION CO_DETALLES_PAGOS RETURN SYS_REFCURSOR IS DETALLE SYS_REFCURSOR;
	BEGIN 
		OPEN DETALLE FOR
			SELECT 
                *
            FROM Detalles_pagos;
		RETURN DETALLE;
	END;
    FUNCTION CO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number) RETURN SYS_REFCURSOR IS DETALLE SYS_REFCURSOR;
	BEGIN 
		OPEN DETALLE FOR
			SELECT 
                *
            FROM requerimientos r
            WHERE r.producto = Xproducto
            AND r.pedido = Xpedido;
		RETURN DETALLE;
	END;
END PC_PEDIDO;
/

                                                                    /*PC_PRODUCTO*/
CREATE OR REPLACE PACKAGE BODY PC_PRODUCTO IS
	PROCEDURE AD_PRODUCTO(XidProducto IN varchar2, Xnombre IN varchar2, Xdescripcion IN varchar2, Xprecio IN number, Xmarca IN varchar2, Xcategoria IN varchar2) IS
	BEGIN
		INSERT INTO productos (idProducto ,nombre ,descripcion ,precio,marca ,categoria ) VALUES (XidProducto, Xnombre , Xdescripcion , Xprecio , Xmarca , Xcategoria  );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar productos');
	END;
    PROCEDURE MO_PRODUCTO(XidProducto IN varchar2, Xprecio IN number, Xmarca IN varchar2) IS
	BEGIN
		UPDATE productos SET precio = Xprecio , marca = Xmarca WHERE idProducto = XidProducto;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en productos');
	END; 
    PROCEDURE EL_PRODUCTO(XidProducto IN varchar2) IS
	BEGIN
		DELETE FROM productos WHERE idProducto = XidProducto;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en productos');
	END; 
    FUNCTION CO_PRODUCTO(XidProducto IN varchar2) RETURN SYS_REFCURSOR IS PRODUCTO SYS_REFCURSOR;
	BEGIN 
		OPEN PRODUCTO FOR
			SELECT 
                *
            FROM productos p
            WHERE idProducto = XidProducto;
		RETURN PRODUCTO;
	END;
    FUNCTION CO_PRODUCTOS_VENDIDOS RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		OPEN PRODUCTOS FOR
			SELECT 
                *
            FROM Productos_vendidos;
		RETURN PRODUCTOS;
	END;
    FUNCTION CO_INFO_PRODUCTOS RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		OPEN PRODUCTOS FOR
			SELECT 
                *
            FROM Info_Productos;
		RETURN PRODUCTOS;
	END;
    FUNCTION CO_PRODUCTOS_MARCA(Xmarca IN varchar2) RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		OPEN PRODUCTOS FOR
			SELECT 
                *
            FROM productos p
            WHERE p.marca = Xmarca;
		RETURN PRODUCTOS;
	END;
    FUNCTION CO_PRODUCTOS_PRECIO(Xprecio IN number) RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		OPEN PRODUCTOS FOR
			SELECT 
                *
            FROM productos p
            WHERE p.precio = Xprecio;
		RETURN PRODUCTOS;
	END;
    FUNCTION CO_PRODUCTOS_CATEGORIA(Xcategoria IN varchar2) RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		OPEN PRODUCTOS FOR
			SELECT 
                *
            FROM productos p
            WHERE p.categoria = Xcategoria;
		RETURN PRODUCTOS;
	END;
END PC_PRODUCTO;
/

                                                                    /*PC_CATEGORIA*/
CREATE OR REPLACE PACKAGE BODY PC_CATEGORIA IS
	PROCEDURE AD_CATEGORIA(XidCategoria IN varchar2, Xnombre IN varchar2, Xcategoria IN varchar2) IS
	BEGIN
		INSERT INTO categorias (idCategoria ,nombre ,categoria ) VALUES (XidCategoria , Xnombre , Xcategoria);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en categorias');
	END;
    PROCEDURE EL_CATEGORIA(XidCategoria IN varchar2) IS
	BEGIN
		DELETE FROM categorias WHERE idCategoria = XidCategoria;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en categorias');
	END;
    FUNCTION CO_CATEGORIA(XidCategoria IN varchar2) RETURN SYS_REFCURSOR IS CATEGORIAS SYS_REFCURSOR;
	BEGIN 
		OPEN CATEGORIAS FOR
			SELECT 
                *
            FROM categorias c
            WHERE c.idCategoria = XidCategoria;
		RETURN CATEGORIAS;
	END;
END PC_CATEGORIA;
/

                                                             /*PC_COMPRA*/
CREATE OR REPLACE PACKAGE BODY PC_COMPRA IS
	PROCEDURE AD_COMPRA(XfechaCompra IN date, Xproveedor IN number , Xdespacho IN number) IS
	BEGIN
		INSERT INTO compras( fechaCompra ,proveedor ,despacho ) VALUES ( XfechaCompra, Xproveedor , Xdespacho);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en compras');
	END;
    PROCEDURE AD_ADQUISICION( Xproducto IN varchar2, Xcompra IN number , Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		INSERT INTO adquisiciones(producto ,compra,cantidad ,precio) VALUES (Xproducto, Xcompra, Xcantidad , Xprecio);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en adquisiciones');
	END;
    PROCEDURE MO_ADQUISICION(Xproducto IN varchar2, Xcompra IN number,Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		UPDATE adquisiciones SET cantidad = Xcantidad , precio = Xprecio WHERE producto = Xproducto AND compra = Xcompra;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en adquisiciones');
	END;
    FUNCTION CO_ADQUISICION(Xproducto IN varchar2, Xcompra IN number) RETURN SYS_REFCURSOR IS ADQUISICIONES SYS_REFCURSOR;
	BEGIN 
		OPEN ADQUISICIONES FOR
			SELECT 
                *
            FROM adquisiciones a
            WHERE a.producto = Xproducto
            AND a.compra = Xcompra;
		RETURN ADQUISICIONES;
	END;
    PROCEDURE  EL_ADQUISICION(Xproducto IN varchar2, Xcompra IN number) IS
	BEGIN
		DELETE FROM adquisiciones WHERE producto = Xproducto AND compra = Xcompra;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en adquisiciones');
	END;
    PROCEDURE  AD_DESPACHO(Xbodega IN varchar2) IS 
	BEGIN
		INSERT INTO despachos ( bodega) VALUES ( Xbodega );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en despachos');
	END;
    PROCEDURE MO_DESPACHO(XidDespacho IN number, XfechaLlegada IN date) IS 
	BEGIN
		UPDATE despachos SET fechaLlegada = XfechaLlegada WHERE idDespacho = XidDespacho;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en despachos');
	END;
    FUNCTION CO_DESPACHO(XidDespacho IN number) RETURN SYS_REFCURSOR IS DESPACHO SYS_REFCURSOR;
	BEGIN 
		OPEN DESPACHO FOR
			SELECT 
                *
            FROM despachos d
            WHERE d.idDespacho = XidDespacho;
		RETURN DESPACHO;
	END;
    FUNCTION CO_DETALLE_COMPRAS RETURN SYS_REFCURSOR IS COMPRAS SYS_REFCURSOR;
	BEGIN 
		OPEN COMPRAS FOR
			SELECT 
                *
            FROM Detalles_Compras;
		RETURN COMPRAS;
	END;
    FUNCTION CO_TIEMPO_DESPACHOS RETURN SYS_REFCURSOR IS DESPACHOS SYS_REFCURSOR;
	BEGIN 
		OPEN DESPACHOS FOR
			SELECT 
                *
            FROM tiempo_despachos;
		RETURN DESPACHOS;
	END;
    FUNCTION CO_DESPACHOS_ESTADOLLEGADA(estado IN varchar2) RETURN SYS_REFCURSOR IS DESPACHOS SYS_REFCURSOR;
	BEGIN 
        IF estado != 'Entregado' AND estado != 'No entregado' THEN
            raise_application_error(-20001,'El estado debe ser entregado o no entregado');
        END IF;
		OPEN DESPACHOS FOR
            SELECT 
                *
            FROM despachos d
            WHERE (d.fechaLlegada is null AND estado = 'No entregado') 
            OR (d.fechaLlegada is not null AND estado = 'Entregado');
        RETURN DESPACHOS;   
	END;
END PC_COMPRA;
/

                                                             /*PC_PROVEEDOR*/
CREATE OR REPLACE PACKAGE BODY PC_PROVEEDOR IS
	PROCEDURE AD_PROVEEDOR(Xdocumento IN number, Xnombre IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
		INSERT INTO proveedores( documento ,nombre ,telefono, correo ) VALUES ( Xdocumento , Xnombre , Xtelefono , Xcorreo);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en proveedores');
	END;
    PROCEDURE MO_PROVEEDOR(Xdocumento IN number, Xnombre IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
		UPDATE proveedores SET nombre = Xnombre , telefono = Xtelefono , correo = Xcorreo WHERE documento = Xdocumento;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en proveedor');
	END;
    FUNCTION CO_PROVEEDOR(Xdocumento IN  number) RETURN SYS_REFCURSOR IS PROVEEDOR SYS_REFCURSOR;
	BEGIN 
		OPEN PROVEEDOR FOR
			SELECT 
                *
            FROM proveedores
            WHERE documento = Xdocumento;
		RETURN PROVEEDOR;
	END;
    FUNCTION CO_INFO_COMPRASPROVEEDORES RETURN SYS_REFCURSOR IS COMPRAS SYS_REFCURSOR;
	BEGIN 
		OPEN COMPRAS FOR
			SELECT 
                *
            FROM Info_proveedores;
		RETURN COMPRAS;
	END;
    PROCEDURE EL_PROVEEDOR(Xdocumento IN number) IS
	BEGIN
		DELETE FROM proveedores WHERE documento = Xdocumento;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en proveedores');
	END;
END PC_PROVEEDOR;
/

                                                    /*PC_BODEGA*/
CREATE OR REPLACE PACKAGE BODY PC_BODEGA IS
	PROCEDURE AD_BODEGA(XidBodega IN varchar2, Xubicacion IN varchar2) IS
	BEGIN
		INSERT INTO bodegas ( idBodega , ubicacion) VALUES (XidBodega , Xubicacion);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en bodegas');
	END;
    FUNCTION CO_BODEGA(XidBodega IN  varchar2) RETURN SYS_REFCURSOR IS BODEGA SYS_REFCURSOR;
	BEGIN 
		OPEN BODEGA FOR
			SELECT 
                *
            FROM bodegas b
            WHERE b.idBodega = XidBodega;
		RETURN BODEGA;
	END;
    PROCEDURE EL_BODEGA(XidBodega IN varchar2) IS
	BEGIN
		DELETE FROM bodegas WHERE idBodega = XidBodega;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en Bodegas');
	END;
    PROCEDURE AD_ALMACENAMIENTO(Xproducto IN varchar2, Xbodega IN varchar2 , Xcantidad IN number) IS
	BEGIN
		INSERT INTO almacenamientos ( producto , bodega , cantidad ) VALUES (Xproducto , Xbodega  , Xcantidad );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en bodegas');
	END;
    PROCEDURE MOD_ALMACENAMIENTO(Xproducto IN varchar2, Xbodega IN varchar2 , Xcantidad IN number) IS
	BEGIN
		UPDATE almacenamientos SET cantidad = Xcantidad WHERE producto = Xproducto AND bodega = Xbodega;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en almacenamientos');
	END;
    FUNCTION CO_ALMACENAMIENTO(Xproducto IN varchar2 , Xbodega IN varchar2) RETURN SYS_REFCURSOR IS ALMACENAMIENTO SYS_REFCURSOR;
	BEGIN 
		OPEN ALMACENAMIENTO FOR
			SELECT 
                *
            FROM almacenamientos a
            WHERE a.producto = Xproducto
            AND a.bodega = Xbodega;
		RETURN ALMACENAMIENTO;
	END;
    PROCEDURE EL_ALMACENAMIENTO(Xbodega IN varchar2, Xproducto IN varchar2) IS
	BEGIN
		DELETE FROM almacenamientos WHERE bodega = Xbodega AND producto = Xproducto;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en almacenamientos');
	END;
    FUNCTION CO_CAPACIDAD_BODEGAS RETURN SYS_REFCURSOR IS ALMACENAMIENTO SYS_REFCURSOR;
	BEGIN 
		OPEN ALMACENAMIENTO FOR
			SELECT 
                *
            FROM Info_Bodegas i;
		RETURN ALMACENAMIENTO;
	END;
    FUNCTION CO_DESPACHOSBODEGA(XidBodega IN varchar2) RETURN SYS_REFCURSOR IS DESPACHOS SYS_REFCURSOR;
	BEGIN 
		OPEN DESPACHOS FOR
			SELECT 
                *
            FROM despachos_bodega d
            WHERE d.idBodega = XidBodega;
		RETURN DESPACHOS;
	END;
END PC_BODEGA;
/

