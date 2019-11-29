--CRUDI--
CREATE OR REPLACE PACKAGE BODY PC_REGISTROS IS
	PROCEDURE AD_REGISTRO(Xtiempo IN number, Xposicion IN number, Xrevision IN varchar2, Xdificultad IN varchar2, Xcomentario IN varchar2, Xciclista IN number, Xsegmento IN varchar2 , Xversion IN number ,  Xdetalle XMLTYPE ) IS
	BEGIN
		INSERT INTO Registros (tiempo ,posicion  ,revision  ,dificultad ,comentario,ciclista ,segmento, version , detalle) VALUES (Xtiempo , Xposicion , Xrevision , Xdificultad , Xcomentario , Xciclista , Xsegmento , Xversion  ,  Xdetalle );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en registros');
	END;
    PROCEDURE MOD_REGISTRO(xnumero IN number , Xrevision IN varchar2, Xcomentario IN varchar2) IS
	BEGIN
		UPDATE registros SET revision = Xrevision , comentario = Xcomentario WHERE numero = Xnumero;
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al modificar en tabla registros');
	END;
    FUNCTION CO_REGISTRO(Xnumero IN number) RETURN XMLTYPE IS CO_RE XMLTYPE;
	BEGIN	
		CO_RE := dbms_xmlgen.getxmltype(
			'SELECT * FROM REGISTROS');
		RETURN CO_RE;
	END;
    PROCEDURE  AD_FOTO(Xdireccion IN varchar2, Xregistro IN number) IS
	BEGIN
		INSERT INTO Fotos(direccion , registro) VALUES  (Xdireccion , Xregistro);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en fotos');
	END;
    PROCEDURE MOD_FOTO(Xdireccion IN varchar2, Xregistro IN number) IS
	BEGIN
		UPDATE fotos SET registro = Xregistro WHERE direccion = Xdireccion;
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al modificar en fotos');
	END;
    PROCEDURE EL_FOTO(Xdireccion IN varchar2) IS
	BEGIN
		DELETE FROM fotos WHERE direccion = Xdireccion;
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al eliminar en fotos');
	END;
    FUNCTION CO_FOTO(Xdireccion IN varchar2) RETURN SYS_REFCURSOR IS FOTO SYS_REFCURSOR;
	BEGIN 
		OPEN FOTO FOR
			SELECT * 
			FROM fotos
            WHERE direccion = Xdireccion;
		RETURN FOTO;
	END;
END PC_REGISTROS;            
/     

--CRUDI--
CREATE OR REPLACE PACKAGE BODY PC_CARRERAS IS
	PROCEDURE AD_CARRERA(Xcodigo IN varchar2, Xnombre IN varchar2, Xpais IN varchar2, Xcategoria IN varchar2, Xperiodicidad IN varchar2) IS 
	BEGIN
		INSERT INTO Carreras (codigo , nombre , pais , categoria , periodicidad) values (Xcodigo , Xnombre  , Xpais ,  Xcategoria ,  Xperiodicidad);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en carreras');
	END;
    PROCEDURE MOD_CARRERA(Xcodigo IN varchar2, Xcategoria IN varchar2) IS 
	BEGIN
		UPDATE carreras SET categoria = Xcategoria WHERE codigo = Xcodigo;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en carreras');
	END;
    PROCEDURE EL_CARRERA(Xcodigo IN varchar2) IS 
	BEGIN
		DELETE FROM Carreras WHERE codigo = Xcodigo;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al eliminar en carreras');
	END;
    FUNCTION CO_CARRERA(Xcodigo IN varchar2) RETURN SYS_REFCURSOR IS CARRERA SYS_REFCURSOR;
	BEGIN 
		OPEN CARRERA FOR
			SELECT * 
			FROM carreras
            WHERE codigo = Xcodigo;
		RETURN CARRERA;
	END;
    PROCEDURE AD_PUNTO(XidPunto IN varchar2, Xnombre IN varchar2, Xdistancia IN number, XtiempoLimite IN number , Xcarrera IN varchar2) IS 
	BEGIN
		INSERT INTO Puntos (id_punto, nombre ,distancia , tiempoLimite ,carrera) values (XidPunto , Xnombre , Xdistancia , XtiempoLimite , Xcarrera );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en puntos');
	END;
    PROCEDURE MOD_PUNTO(XidPunto IN varchar2, Xtipo IN varchar2, XtiempoLimite IN number) IS 
	BEGIN
		UPDATE puntos SET tipo=Xtipo , tiempoLimite=XtiempoLimite WHERE id_punto = XidPunto;
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al modificar en puntos');
	END;
    FUNCTION CO_PUNTO(XidPunto IN varchar2) RETURN SYS_REFCURSOR IS PUNTO SYS_REFCURSOR;
	BEGIN 
		OPEN PUNTO FOR
			SELECT * 
			FROM puntos
            WHERE id_punto = XidPunto;
		RETURN PUNTO;
	END;
    FUNCTION CO_PUNTO_CARRERA(Xcarrera IN varchar2) RETURN SYS_REFCURSOR IS PUNTOCARRERA SYS_REFCURSOR;
	BEGIN 
		OPEN PUNTOCARRERA FOR
			SELECT * 
			FROM puntos p
            WHERE p.carrera = Xcarrera;
		RETURN PUNTOCARRERA;
	END;
END PC_CARRERAS;            
/     