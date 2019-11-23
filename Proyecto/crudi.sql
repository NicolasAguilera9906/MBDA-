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
END PC_PEDIDO;
/

