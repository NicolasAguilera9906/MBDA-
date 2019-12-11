                                                                            
CREATE OR REPLACE PACKAGE PA_JEFELOGISTICA IS 
    PROCEDURE  AD_SEDE(XidSede IN varchar2, Xnombre IN varchar2, Xubicacion IN varchar2);
    PROCEDURE  MOD_SEDE(XidSede IN varchar2, Xnombre IN varchar2);
    PROCEDURE  EL_SEDE(XidSede IN varchar2);
    FUNCTION   CO_SEDE(XidSede IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE  AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2);
    FUNCTION   CO_UBICACION(Xdireccion IN varchar2) RETURN SYS_REFCURSOR;
    FUNCTION   CO_SEDES_ACTIVAS RETURN SYS_REFCURSOR;
END PA_JEFELOGISTICA;
/

CREATE OR REPLACE PACKAGE PA_CLIENTE IS
    PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2);
    PROCEDURE EL_CLIENTE(Xdocumento IN number) ;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR;
    PROCEDURE AD_REGISTRO(Xversion IN varchar2, Xcliente IN number, XfechaRegistro IN date, XhoraRegistro IN number, Xprecio IN number);
    PROCEDURE EL_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2);
    FUNCTION CO_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) RETURN SYS_REFCURSOR;
    FUNCTION CO_VERSION_CIUDAD(Xciudad IN varchar2) RETURN SYS_REFCURSOR;
    FUNCTION CO_VERSION_FECHA(Xfecha IN DATE) RETURN SYS_REFCURSOR;
    FUNCTION CO_INFO_VERSIONES RETURN SYS_REFCURSOR;
END PA_CLIENTE;
/
CREATE OR REPLACE PACKAGE PA_GERENTE IS 
    FUNCTION CO_EVENTOSREGISTROS_ULTIMOMES RETURN SYS_REFCURSOR;
    FUNCTION CO_CLIENTES_MASREGISTRADOS RETURN SYS_REFCURSOR;
END PA_GERENTE;
/

CREATE OR REPLACE PACKAGE PA_JEFEPUBLICIDAD IS 
    PROCEDURE  AD_EVENTO(XidEvento IN varchar2, Xrequisitos IN xmltype, Xperiodicidad IN varchar2, Xnombre IN varchar2, Xdescripcion IN varchar2) ;
    PROCEDURE  MO_EVENTO(XidEvento IN varchar2, Xperiodicidad IN varchar2, Xrequisitos IN xmltype);
    PROCEDURE  EL_EVENTO(XidEvento IN varchar2);
    FUNCTION   CO_EVENTO(XidEvento IN varchar2) RETURN SYS_REFCURSOR;
    PROCEDURE  AD_VERSION(XfechaInicio IN date, XfechaFin IN date, Xsede IN varchar2, Xevento IN varchar2);
    PROCEDURE  MO_VERSION(XidVersion IN varchar2, XfechaInicio IN date, XfechaFin IN date, Xsede IN varchar2);
    PROCEDURE  EL_VERSION(XidVersion IN varchar2) ;
    FUNCTION   CO_VERSION(XidVersion IN varchar2) RETURN SYS_REFCURSOR;
    FUNCTION   CO_NUMVERSIONES_EVENTOS RETURN SYS_REFCURSOR;
END PA_JEFEPUBLICIDAD;
/



