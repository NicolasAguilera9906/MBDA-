                                                             /*PA_GERENTE*/                                                            
CREATE OR REPLACE PACKAGE BODY PA_GERENTE IS
    FUNCTION CO_DETALLES_PAGOS RETURN SYS_REFCURSOR IS PAGOS SYS_REFCURSOR;
    BEGIN
        PAGOS := PC_PEDIDO.CO_DETALLES_PAGOS;
		RETURN PAGOS;
	END;
    FUNCTION CO_DETALLE_COMPRAS RETURN SYS_REFCURSOR IS COMPRAS SYS_REFCURSOR;
    BEGIN
        COMPRAS := PC_COMPRA.CO_DETALLE_COMPRAS;
		RETURN COMPRAS;
	END;
    FUNCTION CO_PRODUCTOS_VENDIDOS RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
    BEGIN
        PRODUCTOS := PC_PRODUCTO.CO_PRODUCTOS_VENDIDOS;
		RETURN PRODUCTOS;
	END;
    FUNCTION CO_INFO_COMPRASPROVEEDORES RETURN SYS_REFCURSOR IS PROVEEDORES SYS_REFCURSOR;
    BEGIN
        PROVEEDORES := PC_PROVEEDOR.CO_INFO_COMPRASPROVEEDORES;
		RETURN PROVEEDORES;
	END;
END PA_GERENTE;            
/

                                                                /*PA_CLIENTE*/
CREATE OR REPLACE PACKAGE BODY PA_CLIENTE IS
    PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
        PC_CLIENTE.AD_CLIENTE(Xdocumento , Xnombres , XfechaNacimiento , Xubicacion, Xtelefono , Xcorreo );
	END;
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
        PC_CLIENTE.MOD_CLIENTE(Xdocumento , Xnombres , Xtelefono , Xcorreo );
	END;
    PROCEDURE EL_CLIENTE(Xdocumento IN number) IS
	BEGIN
        PC_CLIENTE.EL_CLIENTE(Xdocumento );
	END;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR IS CLIENTE SYS_REFCURSOR;
	BEGIN 
        CLIENTE := PC_CLIENTE.CO_CLIENTE(Xdocumento );
        RETURN CLIENTE;
	END;
    FUNCTION CO_INFO_PRODUCTOS RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
        PRODUCTOS := PC_PRODUCTO.CO_INFO_PRODUCTOS;
        RETURN PRODUCTOS;
	END;
    FUNCTION CO_PRODUCTOS_MARCA(Xmarca IN varchar2) RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		PRODUCTOS := PC_PRODUCTO.CO_PRODUCTOS_MARCA(Xmarca);
        RETURN PRODUCTOS;
	END;
    FUNCTION CO_PRODUCTOS_PRECIO(Xprecio IN number) RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		PRODUCTOS := PC_PRODUCTO.CO_PRODUCTOS_PRECIO(Xprecio);
        RETURN PRODUCTOS;
	END;
    FUNCTION CO_PRODUCTOS_CATEGORIA(Xcategoria IN varchar2) RETURN SYS_REFCURSOR IS PRODUCTOS SYS_REFCURSOR;
	BEGIN 
		PRODUCTOS := PC_PRODUCTO.CO_PRODUCTOS_CATEGORIA(Xcategoria);
        RETURN PRODUCTOS;
	END;
END PA_CLIENTE;            
/

                                                        /*PA_JEFEVENTAS*/
CREATE OR REPLACE PACKAGE BODY PA_JEFEVENTAS IS
    FUNCTION CO_TIEMPO_DESPACHOS RETURN SYS_REFCURSOR IS DESPACHOS SYS_REFCURSOR;
    BEGIN 
        DESPACHOS := PC_COMPRA.CO_TIEMPO_DESPACHOS;
    END;
    FUNCTION CO_DESPACHOS_ESTADOLLEGADA(estado IN varchar2) RETURN SYS_REFCURSOR IS DESPACHOS SYS_REFCURSOR;
    BEGIN 
        DESPACHOS := PC_COMPRA.CO_DESPACHOS_ESTADOLLEGADA(estado);
        RETURN DESPACHOS;
    END;
    PROCEDURE AD_COMPRA(XfechaCompra IN date, Xproveedor IN number , Xdespacho IN number) IS
	BEGIN
        PC_COMPRA.AD_COMPRA(XfechaCompra , Xproveedor , Xdespacho );
	END;
    PROCEDURE AD_ADQUISICION( Xproducto IN varchar2, Xcompra IN number , Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		PC_COMPRA.AD_ADQUISICION( Xproducto , Xcompra  , Xcantidad , Xprecio );
	END;
    PROCEDURE MO_ADQUISICION(Xproducto IN varchar2, Xcompra IN number,Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		PC_COMPRA.MO_ADQUISICION(Xproducto , Xcompra,Xcantidad , Xprecio);
	END;
    FUNCTION CO_ADQUISICION(Xproducto IN varchar2, Xcompra IN number) RETURN SYS_REFCURSOR IS ADQUISICIONES SYS_REFCURSOR;
	BEGIN 
		ADQUISICIONES := PC_COMPRA.CO_ADQUISICION(Xproducto , Xcompra );
        RETURN ADQUISICIONES;
	END;
    PROCEDURE  EL_ADQUISICION(Xproducto IN varchar2, Xcompra IN number) IS
	BEGIN
		PC_COMPRA.EL_ADQUISICION(Xproducto , Xcompra );
	END;
    PROCEDURE  AD_DESPACHO(Xbodega IN varchar2) IS 
	BEGIN
		PC_COMPRA.AD_DESPACHO(Xbodega);
	END;
    PROCEDURE MO_DESPACHO(XidDespacho IN number, XfechaLlegada IN date) IS 
	BEGIN
		PC_COMPRA. MO_DESPACHO(XidDespacho , XfechaLlegada);
	END;
    FUNCTION CO_DESPACHO(XidDespacho IN number) RETURN SYS_REFCURSOR IS DESPACHO SYS_REFCURSOR;
	BEGIN 
		DESPACHO:= PC_COMPRA.CO_DESPACHO(XidDespacho);
        RETURN DESPACHO;
	END;
	PROCEDURE AD_PAGO(XfechaLimite IN date) IS
	BEGIN
        PC_PEDIDO.AD_PAGO(XfechaLimite);
	END;
    PROCEDURE MOD_PAGO(XidPago IN number, XfechaPagada IN date) IS
	BEGIN
        PC_PEDIDO.MOD_PAGO(XidPago, XfechaPagada);
	END;
    PROCEDURE EL_PAGO(XidPago IN number) IS
	BEGIN
		PC_PEDIDO.EL_PAGO(XidPago);
	END;
    FUNCTION CO_PAGO(XidPago IN number) RETURN SYS_REFCURSOR IS PAGO SYS_REFCURSOR;
	BEGIN 
		PAGO := PC_PEDIDO.CO_PAGO(XidPago);
        RETURN PAGO;
	END;
    PROCEDURE AD_PEDIDO(Xfecha IN date, Xcliente IN number , Xpago IN number) IS
	BEGIN
		PC_PEDIDO.AD_PEDIDO(Xfecha, Xcliente , Xpago);
	END;
    PROCEDURE EL_PEDIDO(XidPedido IN number) IS
	BEGIN
		PC_PEDIDO.EL_PEDIDO(XidPedido);
	END;
    FUNCTION CO_PEDIDO(XidPedido IN number) RETURN SYS_REFCURSOR IS PEDIDO SYS_REFCURSOR;
	BEGIN 
		PEDIDO := PC_PEDIDO.CO_PEDIDO(XidPedido);
        RETURN PEDIDO;
	END;
    PROCEDURE AD_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number, Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		PC_PEDIDO.AD_REQUERIMIENTO(Xproducto , Xpedido , Xcantidad , Xprecio );
	END;
    PROCEDURE MO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number, Xcantidad IN number, Xprecio IN number) IS
	BEGIN
		PC_PEDIDO.MO_REQUERIMIENTO(Xproducto , Xpedido , Xcantidad , Xprecio );
	END;
    PROCEDURE EL_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number) IS
	BEGIN
		PC_PEDIDO.EL_REQUERIMIENTO(Xproducto , Xpedido);
	END;
    FUNCTION CO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number) RETURN SYS_REFCURSOR IS DETALLE SYS_REFCURSOR;
	BEGIN 
		DETALLE := PC_PEDIDO.CO_REQUERIMIENTO(Xproducto, Xpedido);
	END;
END PA_JEFEVENTAS;            
/

                                                            /* PA_JEFEBODEGA */
                                                            
CREATE OR REPLACE PACKAGE BODY PA_JEFEBODEGA IS
    PROCEDURE AD_BODEGA(XidBodega IN varchar2, Xubicacion IN varchar2) IS
	BEGIN
        PC_BODEGA.AD_BODEGA(XidBodega, Xubicacion);
	END;
    FUNCTION CO_BODEGA(XidBodega IN  varchar2) RETURN SYS_REFCURSOR IS BODEGA SYS_REFCURSOR;
	BEGIN 
		BODEGA := PC_BODEGA.CO_BODEGA(XidBodega);
        RETURN BODEGA;
	END;
    PROCEDURE EL_BODEGA(XidBodega IN varchar2) IS
	BEGIN
        PC_BODEGA.EL_BODEGA(XidBodega);
	END;
    PROCEDURE AD_ALMACENAMIENTO(Xproducto IN varchar2, Xbodega IN varchar2 , Xcantidad IN number) IS
	BEGIN
        PC_BODEGA.AD_ALMACENAMIENTO(Xproducto, Xbodega , Xcantidad);
	END;
    PROCEDURE MOD_ALMACENAMIENTO(Xproducto IN varchar2, Xbodega IN varchar2 , Xcantidad IN number) IS
	BEGIN
        PC_BODEGA.MOD_ALMACENAMIENTO(Xproducto, Xbodega , Xcantidad);
	END;
    FUNCTION CO_ALMACENAMIENTO(Xproducto IN varchar2 , Xbodega IN varchar2) RETURN SYS_REFCURSOR IS ALMACENAMIENTO SYS_REFCURSOR;
	BEGIN 
		ALMACENAMIENTO := PC_BODEGA.CO_ALMACENAMIENTO(Xproducto , Xbodega);
        RETURN ALMACENAMIENTO;
	END;
    PROCEDURE EL_ALMACENAMIENTO(Xbodega IN varchar2, Xproducto IN varchar2) IS
	BEGIN
		PC_BODEGA.EL_ALMACENAMIENTO(Xbodega , Xproducto);
	END;
    FUNCTION CO_CAPACIDAD_BODEGAS RETURN SYS_REFCURSOR IS ALMACENAMIENTO SYS_REFCURSOR;
	BEGIN 
		ALMACENAMIENTO := PC_BODEGA.CO_CAPACIDAD_BODEGAS;
        RETURN ALMACENAMIENTO;
	END;
    FUNCTION CO_DESPACHOSBODEGA(XidBodega IN varchar2) RETURN SYS_REFCURSOR IS DESPACHOS SYS_REFCURSOR;
	BEGIN 
		DESPACHOS := PC_BODEGA.CO_DESPACHOSBODEGA(XidBodega);
        RETURN DESPACHOS;
	END;
END PA_JEFEBODEGA;            
/
                                                    /*PA_JEFELOGISTICA*/
                                                    
CREATE OR REPLACE PACKAGE BODY PA_JEFELOGISTICA IS
    PROCEDURE AD_PROVEEDOR(Xdocumento IN number, Xnombre IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
		PC_PROVEEDOR.AD_PROVEEDOR(Xdocumento, Xnombre , Xtelefono , Xcorreo);
	END;
    PROCEDURE MO_PROVEEDOR(Xdocumento IN number, Xnombre IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
		PC_PROVEEDOR.MO_PROVEEDOR(Xdocumento , Xnombre , Xtelefono , Xcorreo );
	END;
    FUNCTION CO_PROVEEDOR(Xdocumento IN  number) RETURN SYS_REFCURSOR IS PROVEEDOR SYS_REFCURSOR;
	BEGIN 
		PROVEEDOR := PC_PROVEEDOR.CO_PROVEEDOR(Xdocumento);
        RETURN PROVEEDOR;
	END;
    PROCEDURE EL_PROVEEDOR(Xdocumento IN number) IS
	BEGIN
        PC_PROVEEDOR.EL_PROVEEDOR(Xdocumento);
	END;
    PROCEDURE AD_CATEGORIA(XidCategoria IN varchar2, Xnombre IN varchar2, Xcategoria IN varchar2) IS
	BEGIN
		PC_CATEGORIA.AD_CATEGORIA(XidCategoria , Xnombre , Xcategoria);
	END;
    PROCEDURE EL_CATEGORIA(XidCategoria IN varchar2) IS
	BEGIN
		PC_CATEGORIA.EL_CATEGORIA(XidCategoria);
	END;
    FUNCTION CO_CATEGORIA(XidCategoria IN varchar2) RETURN SYS_REFCURSOR IS CATEGORIAS SYS_REFCURSOR;
	BEGIN 
		CATEGORIAS := PC_CATEGORIA.CO_CATEGORIA(XidCategoria);
        RETURN CATEGORIAS;
	END;
    PROCEDURE AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2) IS
	BEGIN
        PC_UBICACION.AD_UBICACION(Xdireccion , Xciudad , Xdepartamento);
	END;
    PROCEDURE MOD_UBICACION(Xdireccion IN varchar2 , Xciudad IN varchar2, Xdepartamento IN varchar2) IS
	BEGIN
        PC_UBICACION.MOD_UBICACION(Xdireccion , Xciudad , Xdepartamento);
	END;
    PROCEDURE EL_UBICACION(Xdireccion IN varchar2) IS
	BEGIN 
        PC_UBICACION.EL_UBICACION(Xdireccion);
	END;
    FUNCTION CO_UBICACION(Xdireccion IN varchar2) RETURN SYS_REFCURSOR IS UBICACIONES SYS_REFCURSOR;
	BEGIN 
        UBICACIONES := PC_UBICACION.CO_UBICACION(Xdireccion);
        RETURN UBICACIONES;
	END;
    PROCEDURE AD_PRODUCTO(XidProducto IN varchar2, Xnombre IN varchar2, Xdescripcion IN varchar2, Xprecio IN number, Xmarca IN varchar2, Xcategoria IN varchar2) IS
	BEGIN
        PC_PRODUCTO.AD_PRODUCTO(XidProducto , Xnombre , Xdescripcion , Xprecio , Xmarca , Xcategoria);
	END;
    PROCEDURE MO_PRODUCTO(XidProducto IN varchar2, Xprecio IN number, Xmarca IN varchar2) IS
	BEGIN
        PC_PRODUCTO.MO_PRODUCTO(XidProducto, Xprecio , Xmarca);
	END; 
    PROCEDURE EL_PRODUCTO(XidProducto IN varchar2) IS
	BEGIN
        PC_PRODUCTO.EL_PRODUCTO(XidProducto);
	END; 
    FUNCTION CO_PRODUCTO(XidProducto IN varchar2) RETURN SYS_REFCURSOR IS PRODUCTO SYS_REFCURSOR;
	BEGIN 
        PRODUCTO := CO_PRODUCTO(XidProducto);
        RETURN PRODUCTO;
	END;
END PA_JEFELOGISTICA;            
/
