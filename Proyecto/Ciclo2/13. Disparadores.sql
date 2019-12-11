DELETE FROM REGISTROS;
DELETE FROM VERSIONES;
                                                                /* Mantener Sede */
-- No se puede modificar una sede mientras tenga alguna version activa.
CREATE OR REPLACE TRIGGER TG_MO_EL_SEDE
    BEFORE UPDATE OR DELETE
    ON Sedes
    FOR EACH ROW
    DECLARE
    XfechaFin DATE;
    XfechaInicio DATE;
BEGIN
    SELECT COALESCE(v.fechaFin,TO_DATE('0001/01/01','YYYY/MM/DD')) INTO XfechaFin
    FROM versiones v
    WHERE v.sede = :old.idSede;
    
    SELECT COALESCE(v.fechaInicio,TO_DATE('0001/01/01','YYYY/MM/DD')) INTO XfechaInicio
    FROM versiones v
    WHERE v.sede = :old.idSede;
    
    IF (XfechaInicio <= sysdate AND sysdate <=XfechaFin) THEN
        RAISE_APPLICATION_ERROR(-20001,'No se puede eliminar o modificar la sede ya que hace parte de una version activa');
    END IF;
    
    UPDATE Versiones SET sede = null WHERE sede = :old.idSede;
END;
/

-- No se puede modificar ni eiliminar una ubicacion
CREATE OR REPLACE TRIGGER TG_MO_EL_UBICACION
    BEFORE UPDATE OR DELETE
    ON Ubicaciones
    FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001,'Las ubicaciones no se pueden eliminar ni modificar');
END;
/

                                                                    /* Mantener Cliente */
-- No se puede modificar el documento ni la fecha de nacimiento de un cliente
CREATE OR REPLACE TRIGGER TG_MO_CLIENTES
    BEFORE UPDATE
        ON clientes
        FOR EACH ROW
BEGIN
    IF :old.documento != :new.documento OR :old.fechaNacimiento != :new.fechaNacimiento THEN
        Raise_application_error(-20021,'No se puede modificar el documento ni la fecha de nacimiento de un cliente');
    END IF;
END;
/

                                                                    /* Mantener Evento */
--Solo se puede modificar la periodicidad y los requisitos de un evento
CREATE OR REPLACE TRIGGER TG_MO_EVENTOS
    BEFORE UPDATE
        ON EventosDeportivos
        FOR EACH ROW
BEGIN
    IF (:old.idEvento != :new.idEvento)  OR (:old.nombre != :new.nombre) OR (:old.descripcion != :new.descripcion) THEN
        RAISE_APPLICATION_ERROR(-20001,'Solo se puede modificar la periodicidad y los requisitos de un evento');
    END IF;
END;
/

                                                                    /* Registrar Version */ 
CREATE SEQUENCE XidVersion
START WITH 1
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE
NOCYCLE;

CREATE OR REPLACE TRIGGER TG_AD_VERSION
  BEFORE INSERT 
  ON Versiones
  FOR EACH ROW 
BEGIN
    :new.idVersion := XidVersion.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TG_MO_VERSION
    BEFORE UPDATE
        ON Versiones
        FOR EACH ROW
BEGIN
    IF (:old.evento != :new.evento) OR (:old.idVersion != :new.idVersion)  THEN
        RAISE_APPLICATION_ERROR(-20001,'No se puede modificar el evento ni el id de una version');
    END IF;
    IF ((:old.fechaFin != :new.fechaFin) OR (:old.fechaInicio != :new.fechaInicio)) AND sysdate >= :old.fechaInicio THEN
        RAISE_APPLICATION_ERROR(-20001,'Solo se puede las fechas de una version de una version mientras no haya comenzado');
    END IF;
END;
/


--El ID de la versión se genera automaticamente
CREATE SEQUENCE XidVersion
START WITH 1
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE
NOCYCLE;
CREATE OR REPLACE TRIGGER TG_AD_VERSION
  BEFORE INSERT 
  ON Versiones
  FOR EACH ROW 
BEGIN
    :new.idVersion := XidVersion.NEXTVAL;
END;
/