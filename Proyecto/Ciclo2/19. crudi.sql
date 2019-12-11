                                                                    /* PC_SEDE */
CREATE OR REPLACE PACKAGE BODY PC_SEDE IS
	PROCEDURE AD_SEDE(XidSede IN varchar2, Xnombre IN varchar2, Xubicacion IN varchar2) IS
	BEGIN
		INSERT INTO sedes (idSede , nombre , ubicacion) VALUES (XidSede , Xnombre, Xubicacion);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en sedes');
	END;
    PROCEDURE MOD_SEDE(XidSede IN varchar2, Xnombre IN varchar2) IS
	BEGIN
		UPDATE Sedes SET nombre = Xnombre WHERE idSede = XidSede;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en sedes');
	END;
    PROCEDURE EL_SEDE(XidSede IN varchar2) IS
	BEGIN
		DELETE FROM SEDES WHERE idSede = XidSede;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en sedes');
	END;
    FUNCTION CO_SEDE(XidSede IN varchar2) RETURN SYS_REFCURSOR IS SEDE SYS_REFCURSOR;
	BEGIN 
		OPEN SEDE FOR
			SELECT 
                *
            FROM sedes s
            WHERE XidSede = idSede;
		RETURN SEDE;
	END;
    PROCEDURE AD_UBICACION(Xdireccion IN varchar2, Xciudad IN varchar2, Xdepartamento IN varchar2) IS
	BEGIN
		INSERT INTO ubicaciones (direccion ,ciudad ,departamento) VALUES (Xdireccion, Xciudad , Xdepartamento);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en ubicacion');
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
    FUNCTION CO_SEDES_ACTIVAS  RETURN SYS_REFCURSOR IS SEDES SYS_REFCURSOR;
    BEGIN 
		OPEN SEDES FOR
            SELECT 
                *
            FROM Sedes_Activas s;
		RETURN SEDES;
	END;
END PC_SEDE;            
/

                                                                            /* PC_CLIENTE */
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
    PROCEDURE AD_REGISTRO(Xversion IN varchar2, Xcliente IN number, XfechaRegistro IN date, XhoraRegistro IN number, Xprecio IN number) IS
	BEGIN
		INSERT INTO Registros (version ,cliente ,fechaRegistro ,horaRegistro ,precio) VALUES (Xversion , Xcliente , XfechaRegistro , XhoraRegistro , Xprecio);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en registros');
	END;
    PROCEDURE EL_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) IS
    BEGIN
		DELETE FROM Registros WHERE version = Xversion AND cliente = Xcliente;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en registros');
	END;
    FUNCTION CO_REGISTRO(Xversion IN varchar2, Xcliente IN varchar2) RETURN SYS_REFCURSOR IS REGISTRO SYS_REFCURSOR;
	BEGIN 
		OPEN REGISTRO FOR
			SELECT 
                *
            FROM registros r
            WHERE r.version = Xversion
            AND r.cliente = Xcliente;
		RETURN REGISTRO;
	END;
    FUNCTION CO_EVENTOSREGISTROS_ULTIMOMES RETURN SYS_REFCURSOR IS DETALLES SYS_REFCURSOR;
	BEGIN 
		OPEN DETALLES FOR
			SELECT 
                *
            FROM EventosRegistrados_UltimoMes;
		RETURN DETALLES;
	END;
    FUNCTION CO_CLIENTES_MASREGISTRADOS RETURN SYS_REFCURSOR IS CLIENTES SYS_REFCURSOR;
	BEGIN 
		OPEN CLIENTES FOR
			SELECT 
                *
            FROM Clientes_MasRegistrados;
		RETURN CLIENTES;
	END;
END PC_CLIENTE;            
/
                                                                                /* PC_EVENTO */
CREATE OR REPLACE PACKAGE BODY PC_EVENTO IS
	PROCEDURE AD_EVENTO(XidEvento IN varchar2, Xrequisitos IN xmltype, Xperiodicidad IN varchar2, Xnombre IN varchar2, Xdescripcion IN varchar2) IS
	BEGIN
		INSERT INTO EventosDeportivos (idEvento , requisitos , periodicidad ,nombre ,descripcion ) VALUES (XidEvento , Xrequisitos , Xperiodicidad , Xnombre , Xdescripcion );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en eventos');
	END;
    PROCEDURE  MO_EVENTO(XidEvento IN varchar2, Xperiodicidad IN varchar2, Xrequisitos IN xmltype) IS
	BEGIN
        UPDATE EventosDeportivos SET periodicidad = Xperiodicidad , requisitos = Xrequisitos WHERE idEvento = XidEvento;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en eventos');
	END;
    PROCEDURE EL_EVENTO(XidEvento IN varchar2) IS
	BEGIN
        DELETE FROM EventosDeportivos WHERE idEvento = XidEvento;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en eventos');
	END;
    FUNCTION CO_EVENTO(XidEvento IN varchar2)  RETURN SYS_REFCURSOR IS EVENTO SYS_REFCURSOR;
	BEGIN 
		OPEN EVENTO FOR
			SELECT 
                *
            FROM EventosDeportivos e
            WHERE e.idEvento = XidEvento;
		RETURN EVENTO;
	END;
    FUNCTION CO_NUMVERSIONES_EVENTOS  RETURN SYS_REFCURSOR IS EVENTOS SYS_REFCURSOR;
	BEGIN 
		OPEN EVENTOS FOR
			SELECT 
                *
            FROM Eventos_VersionesRealizadas e;
		RETURN EVENTOS;
	END;
END PC_EVENTO;            
/

                                                                                /* PC_VERSION */

CREATE OR REPLACE PACKAGE BODY PC_VERSION IS
	PROCEDURE AD_VERSION(XfechaInicio IN date, XfechaFin IN date, Xsede IN varchar2, Xevento IN varchar2) IS
	BEGIN
		INSERT INTO Versiones (fechaInicio , fechaFin , sede , evento ) VALUES (XfechaInicio , XfechaFin , Xsede, Xevento);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en versiones');
	END;
    PROCEDURE MO_VERSION(XidVersion IN varchar2, XfechaInicio IN date, XfechaFin IN date, Xsede IN varchar2) IS
	BEGIN
		UPDATE Versiones SET fechaInicio = XfechaInicio , fechaFin = XfechaFin , sede = Xsede WHERE idVersion = XidVersion;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en versiones');
	END;
    PROCEDURE EL_VERSION(XidVersion IN varchar2) IS
	BEGIN
		DELETE FROM Versiones WHERE idVersion = XidVersion;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en versiones');
	END;
    FUNCTION CO_VERSION(XidVersion IN varchar2)  RETURN SYS_REFCURSOR IS VERSION SYS_REFCURSOR;
	BEGIN 
		OPEN VERSION FOR
			SELECT 
                *
            FROM Versiones v
            WHERE v.idVersion = XidVersion;
		RETURN VERSION;
	END;
    FUNCTION CO_VERSION_CIUDAD(Xciudad IN varchar2) RETURN SYS_REFCURSOR IS VERSIONES SYS_REFCURSOR;
    BEGIN 
		OPEN VERSIONES FOR
            SELECT 
                *
            FROM Info_versiones v
            WHERE v.ciudad = Xciudad;
		RETURN VERSIONES;
	END;
    FUNCTION CO_VERSION_FECHA(Xfecha IN DATE) RETURN SYS_REFCURSOR IS VERSIONES SYS_REFCURSOR;
    BEGIN 
		OPEN VERSIONES FOR
            SELECT 
                *
            FROM Info_versiones v
            WHERE v.fechaI > Xfecha;
		RETURN VERSIONES;
	END;
    FUNCTION CO_INFO_VERSIONES  RETURN SYS_REFCURSOR IS VERSIONES SYS_REFCURSOR;
    BEGIN 
		OPEN VERSIONES FOR
            SELECT 
                *
            FROM Info_versiones v;
		RETURN VERSIONES;
	END;
END PC_VERSION;            
/