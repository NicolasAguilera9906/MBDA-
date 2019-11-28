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



