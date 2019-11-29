CREATE OR REPLACE PACKAGE BODY PA_PARTICIPANTES IS
	PROCEDURE AD_REGISTRO(Xtiempo IN number, Xposicion IN number, Xrevision IN varchar2, Xdificultad IN varchar2, Xcomentario IN varchar2, Xciclista IN number, Xsegmento IN varchar2 , Xversion IN number ,  Xdetalle XMLTYPE ) IS
	BEGIN
		PC_REGISTROS.AD_REGISTRO(Xtiempo , Xposicion , Xrevision , Xdificultad , Xcomentario , Xciclista , Xsegmento , Xversion  ,  Xdetalle );
	END;
    PROCEDURE MOD_REGISTRO(xnumero IN number , Xrevision IN varchar2, Xcomentario IN varchar2) IS
	BEGIN
        PC_REGISTROS.MOD_REGISTRO(xnumero, Xrevision, Xcomentario);
	END;
    FUNCTION CO_REGISTRO(Xnumero IN number) RETURN XMLTYPE IS CO_RE XMLTYPE;
	BEGIN	
		CO_RE := PC_REGISTROS.CO_REGISTRO(Xnumero);
        RETURN CO_RE;
	END;
    PROCEDURE  AD_FOTO(Xdireccion IN varchar2, Xregistro IN number) IS
	BEGIN
        PC_REGISTROS.AD_FOTO(Xdireccion , Xregistro);
	END;
    PROCEDURE MOD_FOTO(Xdireccion IN varchar2, Xregistro IN number) IS
	BEGIN
        PC_REGISTROS.MOD_FOTO(Xdireccion , Xregistro);
	END;
    PROCEDURE EL_FOTO(Xdireccion IN varchar2) IS
	BEGIN
        PC_REGISTROS.EL_FOTO(Xdireccion);
	END;
    FUNCTION CO_FOTO(Xdireccion IN varchar2) RETURN SYS_REFCURSOR IS FOTO SYS_REFCURSOR;
	BEGIN 
		FOTO := PC_REGISTROS.CO_FOTO(Xdireccion);
        RETURN FOTO;
	END;
END PA_PARTICIPANTES;            
/    

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
CREATE OR REPLACE PACKAGE BODY PA_ADMINISTRADOR IS
	PROCEDURE AD_MIEMBRO(Xid IN number, Xidt IN varchar2, Xidn IN number, Xpais IN varchar2, Xcorreo IN varchar2) IS 
	BEGIN
		INSERT INTO miembros (id ,idt   ,idn  ,pais  ,correo ) VALUES (Xid , Xidt , Xidn , Xpais , Xcorreo);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en miembros');
	END;
    FUNCTION CO_MIEMBRO(Xid  IN number) RETURN SYS_REFCURSOR IS MIEMBRO SYS_REFCURSOR;
	BEGIN 
		OPEN MIEMBRO FOR
			SELECT * 
			FROM miembros
            WHERE id = Xid;
		RETURN MIEMBRO;
	END;
    PROCEDURE AD_PERSONA(Xid IN number, Xnombres IN varchar2) IS 
	BEGIN
		INSERT INTO personas ( id ,nombres)  VALUES (Xid , Xnombres);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en personas');
	END;
    FUNCTION CO_PERSONA(Xid IN number) RETURN SYS_REFCURSOR IS PERSONA SYS_REFCURSOR;
	BEGIN 
		OPEN PERSONA FOR
			SELECT * 
			FROM personas
            WHERE id = Xid;
		RETURN PERSONA;
	END;
    PROCEDURE AD_EMPRESA(Xid IN number, XrazonSocial IN varchar2 , Xrepresentante IN number) IS 
	BEGIN
		INSERT INTO empresas (id ,razonSocial  , representante)  VALUES (Xid , XrazonSocial , Xrepresentante);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en empresas');
	END;
    FUNCTION CO_EMPRESA(Xid IN number) RETURN SYS_REFCURSOR IS EMPRESA SYS_REFCURSOR;
	BEGIN 
		OPEN EMPRESA FOR
			SELECT * 
			FROM empresas
            WHERE id = Xid;
		RETURN EMPRESA;
	END;
    PROCEDURE AD_CICLISTA(Xid IN number, Xnacimiento IN varchar2, Xcategoria IN number) IS 
	BEGIN
		INSERT INTO ciclistas (id ,nacimiento  ,categoria )  VALUES (Xid , Xnacimiento , Xcategoria);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en ciclistas');
	END;
    FUNCTION CO_CICLISTA(Xid IN number) RETURN SYS_REFCURSOR IS CICLISTA SYS_REFCURSOR;
	BEGIN 
		OPEN CICLISTA FOR
			SELECT * 
			FROM ciclistas
            WHERE id = Xid;
		RETURN CICLISTA;
	END;
END PA_ADMINISTRADOR;            
/     

