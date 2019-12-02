CREATE OR REPLACE PACKAGE PA_GERENTE IS 
    FUNCTION CO_DETALLES_PAGOS RETURN SYS_REFCURSOR;
    FUNCTION CO_DETALLE_COMPRAS RETURN SYS_REFCURSOR;
    FUNCTION CO_PRODUCTOS_VENDIDOS RETURN SYS_REFCURSOR;
    FUNCTION CO_INFO_COMPRASPROVEEDORES RETURN SYS_REFCURSOR;
END PA_GERENTE;
/
CREATE OR REPLACE PACKAGE PA_CLIENTE IS
    PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE EL_CLIENTE(Xdocumento IN number) ;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR;
    FUNCTION CO_INFO_PRODUCTOS RETURN SYS_REFCURSOR;
    FUNCTION CO_PRODUCTOS_MARCA(Xmarca IN varchar2) RETURN SYS_REFCURSOR;
    FUNCTION CO_PRODUCTOS_PRECIO(Xprecio IN number) RETURN SYS_REFCURSOR;
    FUNCTION CO_PRODUCTOS_CATEGORIA(Xcategoria IN varchar2) RETURN SYS_REFCURSOR;
END PA_CLIENTE;
/

CREATE OR REPLACE PACKAGE PA_JEFEVENTAS IS
    FUNCTION CO_TIEMPO_DESPACHOS RETURN SYS_REFCURSOR;
    FUNCTION CO_DESPACHOS_ESTADOLLEGADA(estado IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE AD_COMPRA(XfechaCompra IN date, Xproveedor IN number , Xdespacho IN number);
    PROCEDURE AD_ADQUISICION( Xproducto IN varchar2, Xcompra IN number , Xcantidad IN number, Xprecio IN number);
    PROCEDURE MO_ADQUISICION(Xproducto IN varchar2, Xcompra IN number,Xcantidad IN number, Xprecio IN number);
    FUNCTION CO_ADQUISICION(Xproducto IN varchar2, Xcompra IN number) RETURN SYS_REFCURSOR;
    PROCEDURE EL_ADQUISICION(Xproducto IN varchar2, Xcompra IN number);
    PROCEDURE AD_DESPACHO( Xbodega IN varchar2);
    PROCEDURE MO_DESPACHO(XidDespacho IN number, XfechaLlegada IN date);
    FUNCTION CO_DESPACHO(XidDespacho IN number) RETURN SYS_REFCURSOR;
    PROCEDURE AD_PAGO(XfechaLimite IN date);
    PROCEDURE MOD_PAGO(XidPago IN number, XfechaPagada IN date);
    PROCEDURE EL_PAGO(XidPago IN number);
    FUNCTION CO_PAGO(XidPago IN number) RETURN SYS_REFCURSOR;
    PROCEDURE  AD_PEDIDO(Xfecha IN date, Xcliente IN number , Xpago IN number);
    PROCEDURE EL_PEDIDO(XidPedido IN number);
    FUNCTION CO_PEDIDO(XidPedido IN number) RETURN SYS_REFCURSOR ;
    PROCEDURE AD_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number, Xcantidad IN number, Xprecio IN number);
    PROCEDURE MO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number, Xcantidad IN number, Xprecio IN number);
    PROCEDURE EL_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number);
    FUNCTION  CO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number) RETURN SYS_REFCURSOR;
END PA_JEFEVENTAS;
/

CREATE OR REPLACE PACKAGE PA_JEFEBODEGA IS 
    PROCEDURE AD_BODEGA(XidBodega IN varchar2, Xubicacion IN varchar2);
    FUNCTION CO_BODEGA(XidBodega IN  varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE EL_BODEGA(XidBodega IN varchar2) ;
    PROCEDURE AD_ALMACENAMIENTO(Xproducto IN varchar2, Xbodega IN varchar2 , Xcantidad IN number);
    PROCEDURE MOD_ALMACENAMIENTO(Xproducto IN varchar2, Xbodega IN varchar2 , Xcantidad IN number);
    FUNCTION CO_ALMACENAMIENTO(Xproducto IN varchar2 , Xbodega IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE EL_ALMACENAMIENTO(Xbodega IN varchar2, Xproducto IN varchar2);
    FUNCTION CO_CAPACIDAD_BODEGAS RETURN SYS_REFCURSOR;
    FUNCTION CO_DESPACHOSBODEGA(XidBodega IN varchar2) RETURN SYS_REFCURSOR;
END PA_JEFEBODEGA;
/

CREATE OR REPLACE PACKAGE PA_JEFELOGISTICA IS
    PROCEDURE AD_PROVEEDOR(Xdocumento IN number, Xnombre IN varchar2, Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE MO_PROVEEDOR(Xdocumento IN number, Xnombre IN varchar2, Xtelefono IN number, Xcorreo IN varchar2);
    FUNCTION CO_PROVEEDOR(Xdocumento IN  number) RETURN SYS_REFCURSOR;
    PROCEDURE EL_PROVEEDOR(Xdocumento IN number);
    PROCEDURE AD_CATEGORIA(XidCategoria IN varchar2, Xnombre IN varchar2, Xcategoria IN varchar2);
    PROCEDURE EL_CATEGORIA(XidCategoria IN varchar2);
    FUNCTION CO_CATEGORIA(XidCategoria IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2);
    PROCEDURE MOD_UBICACION(Xdireccion IN varchar2 , Xciudad IN varchar2, Xdepartamento IN varchar2);
    PROCEDURE EL_UBICACION(Xdireccion IN varchar2);
    FUNCTION CO_UBICACION(Xdireccion IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE AD_PRODUCTO(XidProducto IN varchar2, Xnombre IN varchar2, Xdescripcion IN varchar2, Xprecio IN number, Xmarca IN varchar2, Xcategoria IN varchar2);
    PROCEDURE MO_PRODUCTO(XidProducto IN varchar2, Xprecio IN number, Xmarca IN varchar2);
    FUNCTION  CO_PRODUCTO(XidProducto IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE EL_PRODUCTO(XidProducto IN varchar2);
END PA_JEFELOGISTICA;
