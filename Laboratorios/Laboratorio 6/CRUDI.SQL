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