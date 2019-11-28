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

/* Tablas */

CREATE TABLE Puntos(id_punto VARCHAR( 20 ) NOT NULL,orden NUMBER( 2 ) NOT NULL , nombre VARCHAR( 10 ) NOT NULL ,tipo CHAR( 1 ) NOT NULL,distancia NUMBER( 8,2 ) NOT NULL ,tiempoLimite NUMBER( 9 ) , carrera VARCHAR2( 20 ) NOT NULL) ;
CREATE TABLE Segmentos( nombre VARCHAR( 10 )NOT NULL,tipo CHAR( 1 )NOT NULL,puntoInicial VARCHAR( 20 ) NOT NULL, puntoFinal VARCHAR( 20 ) NOT NULL,version NUMBER( 7 ) NOT NULL ) ;
CREATE TABLE Registros(numero NUMBER( 5 ) NOT NULL, fecha DATE NOT NULL ,tiempo NUMBER( 9 ) NOT NULL ,posicion NUMBER( 5 ) NOT NULL ,revision VARCHAR2( 500 ) ,dificultad CHAR( 1 ) NOT NULL,comentario VARCHAR( 20 ),ciclista NUMBER( 5 ) NOT NULL,segmento VARCHAR2( 10 ) NOT NULL, version NUMBER(5) NOT NULL , detalle XMLTYPE NULL ); 
CREATE TABLE Carreras(codigo VARCHAR2( 20 ) NOT NULL ,nombre VARCHAR2( 30 ) ,pais VARCHAR2( 15 ) , categoria NUMBER( 1 ) , periodicidad CHAR( 1 ) );
CREATE TABLE PropiedadDe(miembro NUMBER( 5 ) NOT NULL ,carrera VARCHAR2( 20 ) NOT NULL, porcentaje NUMBER( 5, 2 ) NOT NULL );
CREATE TABLE Miembros(id NUMBER( 5 ) NOT NULL ,idt CHAR( 2 )  ,idn NUMBER( 15 ) ,pais CHAR( 30 ) ,correo VARCHAR2( 50 ) );
CREATE TABLE Personas( id NUMBER( 5 ) NOT NULL ,nombres VARCHAR2( 50 )) ;
CREATE TABLE Empresas(id NUMBER( 5 ) NOT NULL ,razonSocial VARCHAR2( 30 ) NOT NULL , representante NUMBER( 5 ) NOT NULL);
CREATE TABLE Ciclistas(id NUMBER( 5 ) NOT NULL ,nacimiento VARCHAR2(50) ,categoria NUMBER( 1 ) );
CREATE TABLE Versiones ( id_version NUMBER( 5 ) NOT NULL ,nombre VARCHAR2( 5 ) NOT NULL  ,fecha DATE NOT NULL ,carrera VARCHAR2( 20 ) NOT NULL);
CREATE TABLE Participa( ciclista NUMBER( 5 ) NOT NULL , version NUMBER( 7 ) NOT NULL);
CREATE TABLE EsOrganizador( empresa NUMBER( 5 ) NOT NULL  , version NUMBER( 7 ) NOT NULL  );
CREATE TABLE Fotos(direccion VARCHAR2(20)NOT NULL,registro NUMBER(5)NOT NULL);

/* /CICLO 1: Primarias/ */

ALTER TABLE Carreras ADD CONSTRAINT PK_CARRERAS PRIMARY KEY(codigo);
ALTER TABLE PropiedadDe  ADD CONSTRAINT PK_PROPIEDADDE PRIMARY KEY(miembro,carrera);

ALTER TABLE Miembros ADD CONSTRAINT PK_MIEMBROS PRIMARY KEY(id);
ALTER TABLE Personas ADD CONSTRAINT PK_PERSONAS PRIMARY KEY(id);
ALTER TABLE Empresas ADD CONSTRAINT PK_EMPRESAS PRIMARY KEY(id);
ALTER TABLE Ciclistas ADD CONSTRAINT PK_CICLISTAS PRIMARY KEY(id);

ALTER TABLE Participa ADD CONSTRAINT PK_PARTICIPA PRIMARY KEY(ciclista,version);
ALTER TABLE Versiones ADD CONSTRAINT PK_VERSIONES PRIMARY KEY(id_version);
ALTER TABLE EsOrganizador ADD CONSTRAINT PK_ESORGANIZADOR PRIMARY KEY(empresa,version);

ALTER TABLE Registros ADD CONSTRAINT PK_REGISTROS PRIMARY KEY(numero);
ALTER TABLE Segmentos ADD CONSTRAINT PK_SEGMENTOS PRIMARY KEY(nombre);
ALTER TABLE Puntos ADD CONSTRAINT PK_PUNTOS PRIMARY KEY(id_punto);
ALTER TABLE Fotos ADD CONSTRAINT PK_FOTOS PRIMARY KEY(direccion);

/* CICLO 1: Unicas */
ALTER TABLE Registros ADD CONSTRAINT UK_REGISTROS UNIQUE (comentario);

/*CICLO 1: Foraneas */

ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PROPIEDADDE_CARRERA FOREIGN KEY(carrera)REFERENCES Carreras(codigo);
ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PROPIEDADDE_MIEMBRO FOREIGN KEY(miembro)REFERENCES Miembros(id);

ALTER TABLE Personas ADD CONSTRAINT FK_PERSONAS_ID FOREIGN KEY(id)REFERENCES Miembros(id);
ALTER TABLE Empresas ADD CONSTRAINT FK_EMPRESAS_ID FOREIGN KEY(id)REFERENCES Miembros(id);
ALTER TABLE Empresas ADD CONSTRAINT FK_EMPRESAS_REPRESENTANTE FOREIGN KEY(representante)REFERENCES Personas(id);
ALTER TABLE Ciclistas ADD CONSTRAINT FK_CICLISTAS_ID FOREIGN KEY(id)REFERENCES Personas(id);

ALTER TABLE Participa ADD CONSTRAINT FK_PARTICIPA_CICLISTA FOREIGN KEY(ciclista)REFERENCES Ciclistas(id);
ALTER TABLE Participa ADD CONSTRAINT FK_PARTICIPA_VERSION FOREIGN KEY(version)REFERENCES Versiones(id_version);
ALTER TABLE Versiones ADD CONSTRAINT FK_VERSIONES_CARRERA FOREIGN KEY(carrera)REFERENCES Carreras(codigo);
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_ESORGANIZADOR_EMPRESA FOREIGN KEY(empresa)REFERENCES Empresas(id);
ALTER TABLE EsOrganizador ADD CONSTRAINT FK_ESORGANIZADOR_VERSION FOREIGN KEY(version)REFERENCES Versiones(id_version);

ALTER TABLE Registros ADD CONSTRAINT FK_REGISTROS_CICLISTA FOREIGN KEY(ciclista)REFERENCES Ciclistas(id);
ALTER TABLE Registros ADD CONSTRAINT FK_REGISTROS_SEGMENTO FOREIGN KEY(segmento)REFERENCES Segmentos(nombre);
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_PUNTOINICIAL FOREIGN KEY(puntoInicial)REFERENCES Puntos(id_punto);
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_PUNTOFINAL FOREIGN KEY(puntoFinal)REFERENCES Puntos(id_punto);
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_VERSION FOREIGN KEY(version)REFERENCES Versiones(id_version);
ALTER TABLE Puntos ADD CONSTRAINT FK_PUNTOS_CARRERA FOREIGN KEY(carrera)REFERENCES Carreras(codigo);
ALTER TABLE Fotos ADD CONSTRAINT FK_FOTOS_REGISTRO FOREIGN KEY(registro)REFERENCES Registros(numero);

                                                                /* LAB 6 */
                                                                

/*Inclúyanse como ciclistas.*/
INSERT INTO MBDA.MIEMBROS (tipo , numero , pais , correo , razon , nombres , nacimiento , categoria) VALUES ( 'CC' , 1014308690 , 'Colombia' , 'nicolas@gmail.com' , null , 'Nicolas' , '1994-07-12' , 1);
INSERT INTO MBDA.MIEMBROS (tipo , numero , pais , correo , razon , nombres , nacimiento , categoria) VALUES ( 'CC' , 1014308691 , 'Colombia' , 'miguel@gmail.com' , null , 'Miguel' , '2004-07-12' , 2);

/* Traten de modificarse o borrarse. ¿qué pasa? */
/*UPDATE MBDA.MIEMBROS SET PAIS = 'Chile' WHERE NUMERO = 7409998545;
DELETE FROM  MBDA.MIEMBROS WHERE NUMERO = 7409998545;*/

/*Escriban la instrucción necesaria para lograr ese comportamiento. ¿quién la debería
escribir?
RTA / La deberia escribir el creador de las tablas */

GRANT 
    UPDATE,DELETE ON MBDA.MIEMBROS TO BD2156625,BD2158513;

/*Escriban las instrucciones necesarias para importar los datos de esa tabla a su base de
datos.*/

INSERT INTO MIEMBROS ( id , idt , idn , pais ,  correo) 
    SELECT 
        rownum r,
        m1.tipo,
        m1.numero,
        m1.pais,
        m1.correo 
    FROM MBDA.MIEMBROS m1;

INSERT INTO PERSONAS ( id , nombres)
    SELECT 
        rownum r,
        m1.nombres 
    FROM MBDA.MIEMBROS m1;

INSERT INTO CICLISTAS ( id , nacimiento , categoria) 
    SELECT rownum r,
        m1.nacimiento,
        m1.categoria 
    FROM MBDA.MIEMBROS m1;

