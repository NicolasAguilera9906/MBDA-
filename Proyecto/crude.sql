CREATE OR REPLACE PACKAGE PC_UBICACION IS 
    PROCEDURE AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2);
    PROCEDURE MOD_UBICACION(Xdireccion IN varchar2 , Xciudad IN varchar2, Xdepartamento IN varchar2);
    PROCEDURE EL_UBICACION(Xdireccion IN varchar2);
    FUNCTION CO_UBICACION(Xdireccion IN varchar2) RETURN SYS_REFCURSOR;
END PC_UBICACION;
/
CREATE OR REPLACE PACKAGE PC_CLIENTE IS
    PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE EL_CLIENTE(Xdocumento IN number) ;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR;
END PC_CLIENTE;
/
CREATE OR REPLACE PACKAGE PC_PEDIDO IS
    PROCEDURE AD_PAGO(XfechaLimite IN date);
    PROCEDURE MOD_PAGO(XidPago IN number, XfechaPagada IN date);
    PROCEDURE EL_PAGO(XidPago IN number);
    FUNCTION CO_PAGO(XidPago IN number) RETURN SYS_REFCURSOR;
    /*PROCEDURE  AD_PEDIDO(Xfecha IN date, Xcliente IN number , Xpago IN number);
    FUNCTION CO_PEDIDO(XidPedido IN number) RETURN SYS_REFCURSOR ;
    PROCEDURE AD_REQUERIMIENTO(Xcantidad IN number, Xprecio IN number, Xproducto IN varchar2, Xpedido IN number);
    PROCEDURE MOD_REQUERIMIENTO(Xcantidad IN number, Xprecio IN number, Xproducto IN varchar2, Xpedido IN number);
    PROCEDURE EL_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number);
    FUNCTION  CO_REQUERIMIENTO(Xproducto IN varchar2, Xpedido IN number) RETURN SYS_REFCURSOR;
    FUNCTION CO_DETALLES_PAGOS RETURN SYS_REFCURSOR;
    FUNCTION CO_PAGOS_ESTADOPAGO RETURN SYS_REFCURSOR;*/
END PC_PEDIDO;
/

    