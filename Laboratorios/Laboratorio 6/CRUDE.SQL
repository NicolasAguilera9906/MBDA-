CREATE OR REPLACE PACKAGE PC_REGISTROS IS 
    PROCEDURE AD_REGISTRO(Xtiempo IN number, Xposicion IN number, Xrevision IN varchar2, Xdificultad IN varchar2, Xcomentario IN varchar2, Xciclista IN number, Xsegmento IN varchar2 , Xversion IN number,  Xdetalle XMLTYPE );
    PROCEDURE MOD_REGISTRO(Xnumero IN number , Xrevision IN varchar2, Xcomentario IN varchar2) ;
    FUNCTION CO_REGISTRO(Xnumero IN number)  RETURN XMLTYPE;
    PROCEDURE AD_FOTO(Xdireccion IN varchar2, Xregistro IN number);
    PROCEDURE MOD_FOTO(Xdireccion IN varchar2, Xregistro IN number);
    PROCEDURE EL_FOTO(Xdireccion IN varchar2);
    FUNCTION  CO_FOTO(Xdireccion IN varchar2) RETURN SYS_REFCURSOR;
END PC_REGISTROS;
/

CREATE OR REPLACE PACKAGE PC_CARRERAS IS 
    PROCEDURE AD_CARRERA(Xcodigo IN varchar2, Xnombre IN varchar2, Xpais IN varchar2, Xcategoria IN varchar2, Xperiodicidad IN varchar2);
    PROCEDURE MOD_CARRERA(Xcodigo IN varchar2, Xcategoria IN varchar2);
    PROCEDURE EL_CARRERA(Xcodigo IN varchar2);
    FUNCTION  CO_CARRERA(Xcodigo IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE AD_PUNTO(XidPunto IN varchar2, Xnombre IN varchar2, Xdistancia IN number, XtiempoLimite IN number , Xcarrera IN varchar2);
    PROCEDURE MOD_PUNTO(XidPunto IN varchar2, Xtipo IN varchar2, XtiempoLimite IN number);
    FUNCTION  CO_PUNTO(XidPunto IN varchar2) RETURN SYS_REFCURSOR;
    FUNCTION  CO_PUNTO_CARRERA(Xcarrera IN varchar2) RETURN SYS_REFCURSOR;
END PC_CARRERAS;
/



