--CRUDI--
CREATE OR REPLACE PACKAGE BODY PC_MUSICO IS
	PROCEDURE AD_MUSICO(xm_name IN VARCHAR2,xborn in DATE,xdied IN DATE,xborn_in IN VARCHAR2,xliving_in IN VARCHAR2) IS
	BEGIN
		INSERT INTO musician (m_name,born,died,born_in,living_in) VALUES (xm_name,xborn,xdied,xborn_in,xliving_in);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20001,'Error al insertar en musician');
	END;
	PROCEDURE MOD_MUSICO(xm_no IN NUMBER,xdied IN DATE, xliving_in IN VARCHAR2) IS
	BEGIN
		UPDATE musician SET died=xdied,living_in=xliving_in WHERE m_no=x_no;
		COMMIT;
		EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20002,'Error al modificar en tabla musician');
	END;
	PROCEDURE EL_MUSICO(xm_no IN NUMBER) IS
	BEGIN 
		DELETE FROM musician  WHERE(xm_no=m_no);
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20003,'Error al eliminar un musico, no existe este musico');
	END;
	
	FUNCTION CO_MUSICO RETURN XMLTYPE IS CO_XML XMLTYPE;
	BEGIN	
		CO_XML := dbms_xmlgen.getxmltype(
			'SELECT * FROM MUSICIAN');
		RETURN CO_XML;
	END;
	
	FUNCTION CO_MUSICOS_CIUDAD RETURN SYS_REFCURSOR IS  MUSICOSCIUDAD SYS_REFCURSOR;
	BEGIN 
		OPEN MUSICOSCIUDAD FOR
			SELECT * 
			FROM HARD14;
		RETURN MUSICOSCIUDAD;
	END;
	FUNCTION CO_MUSICOS_UNIVERSIDAD RETURN SYS_REFCURSOR IS MUSICOSUNIVERSIDAD SYS_REFCURSOR;
	BEGIN 
		OPEN MUSICOSUNIVERSIDAD FOR
			SELECT
				m_name,xt.universidad
			FROM 
				musician m ,
				XMLTABLE('/detalle/universidades/universidad'
				PASSING m.detalles
				COLUMNS 
				universidad VARCHAR2(20) PATH '@nombre'
				) xt
			ORDER BY universidad;
		RETURN MUSICOSUNIVERSIDAD;
	END;
	
	FUNCTION CO_MUSICOS_PREMIADOS RETURN SYS REFCURSOR IS MUSICOSPREMIADOS SYS_REFCURSOR;
	BEGIN
		OPEN MUSICOSPREMIADOS FOR
			SELECT
				m_name,xt.año as año ,count(xt.año) as premios
			FROM 
				musician m ,
				XMLTABLE('/detalle/premios/premio'
				PASSING m.detalles
				COLUMNS 
				premio VARCHAR2(20) PATH '@nombre',
				año NUMBER PATH '@año'
				) xt
			GROUP BY m_name,xt.año
			ORDER BY xt.año,premios DESC;
		RETURN MUSICOSPREMIADOS;
	END;
END PC_MUSICO;
	
CREATE OR REPLACE PACKAGE BODY PC_COMPOSICION IS 
	PROCEDURE AD_COMPOSICION(xcomp_date IN DATE,xc_title IN VARCHAR2,xc_in IN NUMBER) IS 
	BEGIN
		INSERT INTO composition(comp_date,c_title,c_in) VALUES(xcomp_date,xc_title,xc_in );
		COMMIT;
		EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
			raise_application_error(-20004,'Error al insertar en composition');
	END;
	
	
	
	
	