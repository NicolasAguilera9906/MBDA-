CREATE OR REPLACE PACKAGE PA_PARTICIPANTES IS 
    PROCEDURE AD_REGISTRO(Xtiempo IN number, Xposicion IN number, Xrevision IN varchar2, Xdificultad IN varchar2, Xcomentario IN varchar2, Xciclista IN number, Xsegmento IN varchar2 , Xversion IN number,  Xdetalle XMLTYPE );
    PROCEDURE MOD_REGISTRO(Xnumero IN number , Xrevision IN varchar2, Xcomentario IN varchar2) ;
    FUNCTION CO_REGISTRO(Xnumero IN number)  RETURN XMLTYPE;
    PROCEDURE AD_FOTO(Xdireccion IN varchar2, Xregistro IN number);
    PROCEDURE MOD_FOTO(Xdireccion IN varchar2, Xregistro IN number);
    PROCEDURE EL_FOTO(Xdireccion IN varchar2);
    FUNCTION  CO_FOTO(Xdireccion IN varchar2) RETURN SYS_REFCURSOR;
END PA_PARTICIPANTES;
/

CREATE OR REPLACE PACKAGE PA_ADMINISTRADOR IS
    PROCEDURE AD_MIEMBRO(Xid IN number, Xidt IN varchar2, Xidn IN number, Xpais IN varchar2, Xcorreo IN varchar2);
    FUNCTION CO_MIEMBRO(Xid  IN number) RETURN SYS_REFCURSOR;
    PROCEDURE AD_PERSONA(Xid IN number, Xnombres IN varchar2);
    FUNCTION CO_PERSONA(Xid IN number) RETURN SYS_REFCURSOR;
    PROCEDURE AD_EMPRESA(Xid IN number, XrazonSocial IN varchar2 , Xrepresentante IN number);
    FUNCTION CO_EMPRESA(Xid IN number) RETURN SYS_REFCURSOR;
    PROCEDURE AD_CICLISTA(Xid IN number, Xnacimiento IN varchar2, Xcategoria IN number);
    FUNCTION CO_CICLISTA(Xid IN number) RETURN SYS_REFCURSOR;
END PA_ADMINISTRADOR;
