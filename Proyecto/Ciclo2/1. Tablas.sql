BEGIN
   FOR cur_rec IN (SELECT object_name, object_type
                     FROM user_objects
                    WHERE object_type IN
                             ('TABLE',
                              'VIEW',
                              'PACKAGE',
                              'PROCEDURE',
                              'FUNCTION',
                              'SEQUENCE',
                              'SYNONYM',
                              'PACKAGE BODY'
                             ))
   LOOP
      BEGIN
         IF cur_rec.object_type = 'TABLE'
         THEN
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '" CASCADE CONSTRAINTS';
         ELSE
            EXECUTE IMMEDIATE    'DROP '
                              || cur_rec.object_type
                              || ' "'
                              || cur_rec.object_name
                              || '"';
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line (   'FAILED: DROP '
                                  || cur_rec.object_type
                                  || ' "'
                                  || cur_rec.object_name
                                  || '"'
                                 );
      END;
   END LOOP;
END;
/

CREATE TABLE Clientes(
documento NUMBER(15)NOT NULL,
nombres VARCHAR2(25)NOT NULL,
fechaNacimiento DATE NOT NULL,
ubicacion VARCHAR2(15)NOT NULL,
telefono NUMBER(10)NOT NULL,
correo VARCHAR2(30)NOT NULL
);

CREATE TABLE Ubicaciones(
direccion VARCHAR2(15)NOT NULL,
ciudad VARCHAR2(15)NOT NULL,
departamento VARCHAR2(15)NOT NULL
);

CREATE TABLE Versiones(
idVersion NUMBER (5)NOT NULL ,
fechaInicio DATE NOT NULL ,
fechaFin DATE  NOT NULL, 
sede VARCHAR2 (5) ,
evento VARCHAR2 (5) NOT NULL
);

CREATE TABLE Fotos (
url VARCHAR2 (50) NOT NULL ,
version NUMBER (5)NOT NULL
);


CREATE TABLE Sedes(
idSede VARCHAR2(5) NOT NULL,
nombre VARCHAR2(50) NOT NULL,
ubicacion VARCHAR2 (15) NOT NULL
);

CREATE TABLE EventosDeportivos (
idEvento VARCHAR2(5) NOT NULL,
requisitos XMLTYPE,
periodicidad VARCHAR2(1) NOT NULL,
nombre VARCHAR2 (20) NOT NULL ,
descripcion VARCHAR2 (500) NOT NULL
);

CREATE TABLE Registros (
version NUMBER(5) NOT NULL,
cliente NUMBER(15) NOT NULL,
fechaRegistro DATE NOT NULL,
horaRegistro NUMBER (4) NOT NULL ,
precio NUMBER (10) NOT NULL
);









