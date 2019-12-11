                                                                        /* PA_JEFELOGISTICA */
CREATE OR REPLACE PACKAGE BODY PA_JEFELOGISTICA IS
    PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
        PC_CLIENTE.AD_CLIENTE(Xdocumento , Xnombres , XfechaNacimiento , Xubicacion  , Xtelefono , Xcorreo);
	END;
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
        PC_CLIENTE.MOD_CLIENTE(Xdocumento , Xnombres , Xtelefono , Xcorreo);
	END;
    PROCEDURE EL_CLIENTE(Xdocumento IN number) IS
	BEGIN
        PC_CLIENTE.EL_CLIENTE(Xdocumento);
	END;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR IS CLIENTE SYS_REFCURSOR;
	BEGIN 
        CLIENTE := PC_CLIENTE.CO_CLIENTE(Xdocumento);
		RETURN CLIENTE;
	END;
    PROCEDURE AD_REGISTRO(Xversion IN varchar2, Xcliente IN number, XfechaRegistro IN date, XhoraRegistro IN number, Xprecio IN number) IS
	BEGIN
        PC_CLIENTE.AD_REGISTRO(Xversion , Xcliente, XfechaRegistro, XhoraRegistro, Xprecio);
	END;
    PROCEDURE EL_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) IS
	BEGIN
        PC_CLIENTE.EL_REGISTRO(Xversion , Xcliente);
	END;
    FUNCTION CO_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) RETURN SYS_REFCURSOR IS REGISTRO SYS_REFCURSOR;
	BEGIN 
        REGISTRO:= PC_CLIENTE.CO_REGISTRO(Xversion , Xcliente);
		RETURN REGISTRO;
	END;
    PROCEDURE AD_SEDE(XidSede IN varchar2, Xnombre IN varchar2, Xubicacion IN varchar2) IS
	BEGIN
        PC_SEDE.AD_SEDE(XidSede, Xnombre, Xubicacion);
	END;
    PROCEDURE MOD_SEDE(XidSede IN varchar2, Xnombre IN varchar2) IS
    BEGIN
        PC_SEDE.MOD_SEDE(XidSede , Xnombre);
	END;
    PROCEDURE EL_SEDE(XidSede IN varchar2) IS
    BEGIN
        PC_SEDE.EL_SEDE(XidSede);
	END;
    FUNCTION CO_SEDE(XidSede IN varchar2) RETURN SYS_REFCURSOR IS SEDE SYS_REFCURSOR;
	BEGIN 
        SEDE:= PC_SEDE.CO_SEDE(XidSede);
		RETURN SEDE;
	END;
    PROCEDURE AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2) IS
    BEGIN
        PC_SEDE.AD_UBICACION(Xdireccion , Xciudad , Xdepartamento );
	END;
    FUNCTION CO_UBICACION(Xdireccion IN varchar2) RETURN SYS_REFCURSOR IS UBICACION SYS_REFCURSOR;
	BEGIN 
        UBICACION := PC_SEDE.CO_UBICACION(Xdireccion);
		RETURN UBICACION;
	END;
    FUNCTION CO_SEDES_ACTIVAS RETURN SYS_REFCURSOR IS SEDES SYS_REFCURSOR;
	BEGIN 
        SEDES := PC_SEDE.CO_SEDES_ACTIVAS;
		RETURN SEDES;
	END;
END PA_JEFELOGISTICA;            
/

                                                                                /*PA_GERENTE*/
CREATE OR REPLACE PACKAGE BODY PA_GERENTE IS
    FUNCTION CO_EVENTOSREGISTROS_ULTIMOMES RETURN SYS_REFCURSOR IS EVENTOS SYS_REFCURSOR;
	BEGIN 
        EVENTOS := PC_CLIENTE.CO_EVENTOSREGISTROS_ULTIMOMES;
		RETURN EVENTOS;
	END;
    FUNCTION CO_CLIENTES_MASREGISTRADOS RETURN SYS_REFCURSOR IS CLIENTES SYS_REFCURSOR;
	BEGIN 
        CLIENTES := PC_CLIENTE.CO_CLIENTES_MASREGISTRADOS;
		RETURN CLIENTES;
	END;
END PA_GERENTE;            
/

                                                                /*PA_JEFEPUBLICIDAD*/
CREATE OR REPLACE PACKAGE BODY PA_JEFEPUBLICIDAD IS
    PROCEDURE AD_EVENTO(XidEvento IN varchar2, Xrequisitos IN xmltype, Xperiodicidad IN varchar2, Xnombre IN varchar2, Xdescripcion IN varchar2) IS
    BEGIN
        PC_EVENTO.AD_EVENTO(XidEvento, Xrequisitos, Xperiodicidad , Xnombre, Xdescripcion);
	END;
    PROCEDURE MO_EVENTO(XidEvento IN varchar2, Xperiodicidad IN varchar2, Xrequisitos IN xmltype) IS
    BEGIN
        PC_EVENTO.MO_EVENTO(XidEvento , Xperiodicidad , Xrequisitos );
	END;
    PROCEDURE EL_EVENTO(XidEvento IN varchar2) IS
    BEGIN
        PC_EVENTO.EL_EVENTO(XidEvento);
	END;
    FUNCTION CO_EVENTO(XidEvento IN varchar2) RETURN SYS_REFCURSOR IS EVENTO SYS_REFCURSOR;
	BEGIN 
        EVENTO := PC_EVENTO.CO_EVENTO(XidEvento);
		RETURN EVENTO;
	END;
    PROCEDURE AD_VERSION(XfechaInicio IN date, XfechaFin IN date, Xsede IN varchar2, Xevento IN varchar2) IS
    BEGIN
        PC_VERSION.AD_VERSION(XfechaInicio, XfechaFin, Xsede , Xevento);
	END;
    PROCEDURE MO_VERSION(XidVersion IN varchar2, XfechaInicio IN date, XfechaFin IN date, Xsede IN varchar2) IS
    BEGIN
        PC_VERSION.MO_VERSION(XidVersion , XfechaInicio, XfechaFin , Xsede);
	END;
    PROCEDURE EL_VERSION(XidVersion IN varchar2) IS
    BEGIN
        PC_VERSION.EL_VERSION(XidVersion);
	END;
    FUNCTION CO_VERSION(XidVersion IN varchar2) RETURN SYS_REFCURSOR IS VERSION SYS_REFCURSOR;
	BEGIN 
        VERSION := PC_VERSION.CO_VERSION(XidVersion);
		RETURN VERSION;
	END;
    FUNCTION CO_NUMVERSIONES_EVENTOS RETURN SYS_REFCURSOR IS EVENTOS SYS_REFCURSOR;
	BEGIN 
        EVENTOS := PC_EVENTO.CO_NUMVERSIONES_EVENTOS;
		RETURN EVENTOS;
	END;
END PA_JEFEPUBLICIDAD;            
/


CREATE OR REPLACE PACKAGE BODY PA_CLIENTE IS
    PROCEDURE AD_CLIENTE(Xdocumento IN number, Xnombres IN varchar2, XfechaNacimiento IN date, Xubicacion IN varchar2 , Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
        PC_CLIENTE.AD_CLIENTE(Xdocumento , Xnombres , XfechaNacimiento , Xubicacion  , Xtelefono , Xcorreo);
	END;
    PROCEDURE MOD_CLIENTE(Xdocumento IN NUMBER , Xnombres IN varchar2, Xtelefono IN number, Xcorreo IN varchar2) IS
	BEGIN
        PC_CLIENTE.MOD_CLIENTE(Xdocumento , Xnombres , Xtelefono , Xcorreo);
	END;
    PROCEDURE EL_CLIENTE(Xdocumento IN number) IS
	BEGIN
        PC_CLIENTE.EL_CLIENTE(Xdocumento);
	END;
    FUNCTION CO_CLIENTE(Xdocumento IN number) RETURN SYS_REFCURSOR IS CLIENTE SYS_REFCURSOR;
	BEGIN 
        CLIENTE := PC_CLIENTE.CO_CLIENTE(Xdocumento);
		RETURN CLIENTE;
	END;
    PROCEDURE AD_REGISTRO(Xversion IN varchar2, Xcliente IN number, XfechaRegistro IN date, XhoraRegistro IN number, Xprecio IN number) IS
	BEGIN
        PC_CLIENTE.AD_REGISTRO(Xversion , Xcliente, XfechaRegistro, XhoraRegistro, Xprecio);
	END;
    PROCEDURE EL_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) IS
	BEGIN
        PC_CLIENTE.EL_REGISTRO(Xversion , Xcliente);
	END;
    FUNCTION CO_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) RETURN SYS_REFCURSOR IS REGISTRO SYS_REFCURSOR;
	BEGIN 
        REGISTRO:= PC_CLIENTE.CO_REGISTRO(Xversion , Xcliente);
		RETURN REGISTRO;
	END;
    FUNCTION CO_VERSION_CIUDAD(Xciudad IN varchar2) RETURN SYS_REFCURSOR IS VERSIONES SYS_REFCURSOR;
    BEGIN 
		VERSIONES :=  PC_VERSION.CO_VERSION_CIUDAD(Xciudad);
		RETURN VERSIONES;
	END;
    FUNCTION CO_VERSION_FECHA(Xfecha IN DATE) RETURN SYS_REFCURSOR IS VERSIONES SYS_REFCURSOR;
    BEGIN 
		VERSIONES := PC_VERSION.CO_VERSION_FECHA(Xfecha);
		RETURN VERSIONES;
	END;
    FUNCTION CO_INFO_VERSIONES  RETURN SYS_REFCURSOR IS VERSIONES SYS_REFCURSOR;
    BEGIN 
		VERSIONES := PC_VERSION.CO_INFO_VERSIONES;
		RETURN VERSIONES;
	END;
END PA_CLIENTE;            
/