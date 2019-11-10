/* C. Construcción: creando */

/* CICLO 1: Tablas*/

CREATE TABLE Puntos(id_punto VARCHAR( 20 ) NOT NULL,orden NUMBER( 2 ) NOT NULL , nombre VARCHAR( 10 ) NOT NULL ,tipo CHAR( 1 ) NOT NULL,distancia NUMBER( 8,2 ) NOT NULL ,tiempoLimite NUMBER( 9 ) NOT NULL, carrera VARCHAR2( 20 ) NOT NULL) ;
CREATE TABLE Segmentos( nombre VARCHAR( 10 )NOT NULL,tipo CHAR( 1 )NOT NULL,puntoInicial VARCHAR( 20 ) NOT NULL, puntoFinal VARCHAR( 20 ) NOT NULL,version NUMBER( 7 ) NOT NULL ) ;
CREATE TABLE Registros(numero NUMBER( 5 ) NOT NULL, fecha DATE NOT NULL ,tiempo NUMBER( 9 ) NOT NULL ,posicion NUMBER( 5 ) NOT NULL ,revision VARCHAR2( 500 ) ,dificultad CHAR( 1 ) NOT NULL  ,fotos VARCHAR( 50 ) NOT NULL ,comentario VARCHAR( 20 ),ciclista NUMBER( 5 ) NOT NULL,segmento VARCHAR2( 10 ) NOT NULL, version NUMBER(5) NOT NULL ); 

CREATE TABLE Carreras(codigo VARCHAR2( 20 ) NOT NULL ,nombre VARCHAR2( 30 ) ,pais VARCHAR2( 15 ) , categoria NUMBER( 1 ) , periodicidad CHAR( 1 ) );
CREATE TABLE PropiedadDe(miembro NUMBER( 5 ) NOT NULL ,carrera VARCHAR2( 20 ) NOT NULL, porcentaje NUMBER( 5, 2 ) NOT NULL );

CREATE TABLE Miembros(id NUMBER( 5 ) NOT NULL ,idt CHAR( 2 ) NOT NULL ,idn NUMBER( 15 )NOT NULL ,pais CHAR( 15 ) NOT NULL,correo VARCHAR2( 30 ) NOT NULL );
CREATE TABLE Personas( id NUMBER( 5 ) NOT NULL ,nombres VARCHAR2( 50 ) NOT NULL ) ;
CREATE TABLE Empresas(id NUMBER( 5 ) NOT NULL ,razonSocial VARCHAR2( 30 ) NOT NULL , representante NUMBER( 5 ) NOT NULL); 
CREATE TABLE Ciclistas(id NUMBER( 5 ) NOT NULL ,nacimiento DATE NOT NULL ,categoria NUMBER( 1 ) NOT NULL );

CREATE TABLE Versiones ( id_version NUMBER( 5 ) NOT NULL ,nombre VARCHAR2( 5 ) NOT NULL  ,fecha DATE NOT NULL ,carrera VARCHAR2( 20 ) NOT NULL);
CREATE TABLE Participa( ciclista NUMBER( 5 ) NOT NULL , version NUMBER( 7 ) NOT NULL);
CREATE TABLE EsOrganizador( empresa NUMBER( 5 ) NOT NULL  , version NUMBER( 7 ) NOT NULL  );

/* CICLO 1: XTablas 

DROP TABLE Puntos;
DROP TABLE Segmentos;
DROP TABLE Registros;
DROP TABLE Carreras;
DROP TABLE PropiedadDe;
DROP TABLE Miembros;    
DROP TABLE Personas;
DROP TABLE Empresas;
DROP TABLE Ciclistas;
DROP TABLE Versiones;
DROP TABLE Participa;
DROP TABLE EsOrganizador;

*/

/* D. Construcción: poblando  */ 

/* CICLO 1: PoblarOK (1) */

--CRUD MIEMBROS--
/*
INSERT INTO Miembros VALUES (1,'CC',1014308690,'COLOMBIA','nicolasaguilera@gmail.com');
INSERT INTO Personas VALUES (1,'Nicolas Aguilera');

INSERT INTO Miembros VALUES (2,'CC',1000658594,'ARGENTINA','miguelfuquene@yahoo.com');
INSERT INTO Personas VALUES (2,'Miguel Fuquene');
INSERT INTO Ciclistas VALUES (2,TO_DATE('1999/10/06','YYYY/MM/DD'),2);

INSERT INTO Miembros VALUES (3,'NT',958305860397,'INGLATERRA','ineos@ineos.edu.co');
INSERT INTO Empresas VALUES (3,'INEOS',4);
INSERT INTO Miembros VALUES (4,'CC',143548594,'ECUADOR','laurarodriguez@yahoo.com');
INSERT INTO Personas VALUES (4,'Laura Rodriguez');

--CRUD CARRERAS--
INSERT INTO Carreras VALUES ('CR001','Tour de Francia','FRANCIA',1,'A');
INSERT INTO Miembros VALUES (5,'CC',10147859595,'FRANCIA','juanfernandez@gmail.com');
INSERT INTO Personas VALUES (5,'Juan Fernandez');
INSERT INTO PropiedadDe VALUES (5,'CR001',65.25);

INSERT INTO Carreras VALUES ('CR002','Tour de Francia','FRANCIA',1,'A');
INSERT INTO PropiedadDe VALUES (1,'CR002',50.25);

INSERT INTO Carreras VALUES ('CR003','Tour de Francia','FRANCIA',1,'A');
INSERT INTO PropiedadDe VALUES (3,'CR003',45.30);

--CRUD REGISTRO--
/*
INSERT INTO Versiones VALUES (1,'20191',TO_DATE('1999/10/01','YYYY/MM/DD'),'CR001');
INSERT INTO Puntos VALUES ('CR001P1',3,'puntoh','H',10.2,30,'CR001');
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','M',2.2,5,'CR001');
INSERT INTO Segmentos VALUES('montaña','M','CR001P1','CR001P2',1);
INSERT INTO Registros VALUES (1,TO_DATE('1999/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),10,1,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','A','www.ineosfotos.pdf','Excelente',2,'montaña',1);

-- CRUD VERSION ---
/*
INSERT INTO Versiones VALUES (2,'20191',TO_DATE('2019/10/01','YYYY/MM/DD'),'CR004');
INSERT INTO Carreras VALUES ('CR004','Tour de Francia','FRANCIA',1,'A');

INSERT INTO Versiones VALUES (3,'20201',TO_DATE('2020/10/01','YYYY/MM/DD'),'CR005');
INSERT INTO Carreras VALUES ('CR005','Giro de Italia','ITALIA',2,'A');

INSERT INTO Versiones VALUES (4,'20211',TO_DATE('2021/10/01','YYYY/MM/DD'),'CR006');
INSERT INTO Carreras VALUES ('CR005','Vuelta a España','ESPAÑA',3,'B');

/* CICLO 1: PoblarNoOK (2) 

--Deseamos validar que la distancia tenga como maximo 6 digitos para la parte entera y 2 digitos para la parte decimal
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','M',6478667.98,5,'CR001');

--Deseamos validar que la fecha ingresada tenga el formato YYYY/MM/DD
INSERT INTO Registros VALUES (1,TO_DATE('1999999/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),10,5,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','A','www.ineosfotos.pdf','Excelente',2,'rocoso',1);

--Deseamos validar que la periodicidad de la carrera se representa mediante un caracter
INSERT INTO Carreras VALUES ('CR003','Tour de Francia','FRANCIA',1,'AB');

--Deseamos validar que el documento de un miembro no sea mayor a 15 digitos
INSERT INTO Miembros VALUES (2,'CC',1111111111111111,'ARGENTINA','miguelfuquene@yahoo.com');

--Deseamos validar que no haya versiones que no pertenezcan a una carrera
INSERT INTO Versiones VALUES (3,'20201',TO_DATE('2020/10/01','YYYY/MM/DD'),NULL);

/* CICLO 1: PoblarNoOK (3) 

--Deseamos validar que el documento sea mayor a 1111111111
INSERT INTO Miembros VALUES (2,'CC',10000,'ARGENTINA','miguelfuquene@yahoo.com');

--Deseamos validar que el correo siga este formato ^[^@]+@[^@]+\.[a-zA-Z]{2,}$
INSERT INTO Miembros VALUES (2,'CC',2111111111,'ARGENTINA','miguelfuqueneyahoo.com');

--Deseamos validar que la periodicidad de la carrera sea 'A' O 'S'
INSERT INTO Carreras VALUES ('CR003','Tour de Francia','FRANCIA',1,'C');

--Deseamos validar que la distancia sea positiva
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','M',-647.98,5,'CR001');

--Deseamos validar que el tipo de segmento sea 'C' , 'M' O 'L'
INSERT INTO Segmentos VALUES('descanso','H','CR001P1','CR001P2',1);

/* CICLO 1: XPoblar */

/*DELETE FROM Puntos;
DELETE FROM Segmentos;
DELETE FROM Versiones;
DELETE FROM Registros;
DELETE FROM Ciclistas;
DELETE FROM Personas;
DELETE FROM Empresas;
DELETE FROM EsOrganizador;
DELETE FROM Participa;
DELETE FROM Miembros;
DELETE FROM PropiedadDe;
DELETE FROM Carreras;*/

/* D. Construcción: protegiendo */ 

/* CICLO 1 : Atributos */

ALTER TABLE Carreras ADD CONSTRAINT CK_CARRERAS_CODIGO CHECK(codigo = UPPER(codigo) and REGEXP_LIKE (codigo,'^[A-Z0-9]*$' ));
ALTER TABLE Carreras ADD CONSTRAINT CK_CARRERAS_PAIS CHECK(pais = UPPER(pais) and REGEXP_LIKE (pais,'^[A-Z _]*$'));
ALTER TABLE Carreras ADD CONSTRAINT CK_CARRERAS_CATEGORIA CHECK(categoria >=1 and categoria <= 5);
ALTER TABLE Carreras ADD CONSTRAINT CK_CARRERAS_PERIODICIDAD CHECK(periodicidad = 'S' OR periodicidad ='A');
ALTER TABLE PropiedadDe ADD CONSTRAINT CK_PROPIEDADDE_CARRERA CHECK(carrera = UPPER(carrera) and REGEXP_LIKE (carrera,'^[A-Z0-9]*$' ));
ALTER TABLE PropiedadDe ADD CONSTRAINT CK_PROPIEDADDE_PORCENTAJE CHECK(porcentaje>0 AND porcentaje <= 100.0);
ALTER TABLE PropiedadDe ADD CONSTRAINT CK_PROPIEDADDE_MIEMBRO CHECK(miembro>=1 AND miembro <= 99999);

ALTER TABLE Puntos ADD CONSTRAINT CK_PUNTOS_ID CHECK(id_punto = UPPER(id_punto) and REGEXP_LIKE (id_punto,'^[A-Z0-9]*$' ));
ALTER TABLE Puntos ADD CONSTRAINT CK_PUNTOS_TIPO CHECK(tipo IN ('P','L','H','A','M','V','C'));
ALTER TABLE Puntos ADD CONSTRAINT CK_PUNTOS_DISTANCIA CHECK(distancia >0 AND distancia <= 999999.99);
ALTER TABLE Puntos ADD CONSTRAINT CK_PUNTOS_TIEMPOLIMITE CHECK (tiempoLimite >0 AND tiempoLimite <= 999999999);
ALTER TABLE Puntos ADD CONSTRAINT CK_PUNTOS_CARRERA CHECK(carrera = UPPER(carrera) and REGEXP_LIKE (carrera,'^[A-Z0-9]*$' ));
ALTER TABLE Segmentos ADD CONSTRAINT CK_SEGMENTOS_TIPOSEGMENTO CHECK (tipo IN ('L','M','C'));
ALTER TABLE Segmentos ADD CONSTRAINT CK_SEGMENTOS_PUNTOINICIAL CHECK(puntoInicial = UPPER(puntoInicial) and REGEXP_LIKE (puntoInicial,'^[A-Z0-9]*$'));
ALTER TABLE Segmentos ADD CONSTRAINT CK_SEGMENTOS_PUNTOFINAL CHECK(puntoFinal = UPPER(puntoFinal) and REGEXP_LIKE (puntoFinal,'^[A-Z0-9]*$'));
ALTER TABLE Segmentos ADD CONSTRAINT CK_SEGMENTOS_VERSION CHECK(version >= 1 and version <=99999);
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_NUMERO CHECK(numero>=1 AND numero <=99999);
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_DURACION CHECK(tiempo>0 AND tiempo <=999999999);
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_DIFICULTAD CHECK(dificultad IN ('A','M','B'));
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_FOTOS CHECK(fotos LIKE 'www.%' and (FOTOS LIKE '%.pdf' OR FOTOS LIKE '%.gif'));
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_CICLISTA CHECK(ciclista>=1 AND ciclista <= 99999);
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_VERSION CHECK(version >= 1 and version <=99999);

ALTER TABLE Miembros ADD CONSTRAINT CK_MIEMBROS_ID CHECK(id>=1 and id<=99999);
ALTER TABLE Miembros ADD CONSTRAINT CK_MIEMBROS_IDT CHECK(idt IN ('CC','CE','NT'));
ALTER TABLE Miembros ADD CONSTRAINT CK_MIEMBROS_IDN CHECK(idn>=1111111111);
ALTER TABLE Miembros ADD CONSTRAINT CK_MIEMBROS_PAIS CHECK(pais = UPPER(pais) and REGEXP_LIKE (pais,'^[A-Z _]*$'));
ALTER TABLE Miembros ADD CONSTRAINT CK_MIEMBROS_CORREO CHECK(REGEXP_LIKE (correo,'^[^@]+@[^@]+\.[a-zA-Z]{2,}$'));
ALTER TABLE Personas ADD CONSTRAINT CK_PERSONAS_ID CHECK(id>=1 and id<=99999);
ALTER TABLE Empresas ADD CONSTRAINT CK_EMPRESAS_ID CHECK(id>=1 and id<=99999);
ALTER TABLE Empresas ADD CONSTRAINT CK_EMPRESAS_REPRESENTANTE CHECK(representante>=1 and representante<=99999);
ALTER TABLE Ciclistas ADD CONSTRAINTS CK_CICLISTAS_ID CHECK(id>=1 and id<=99999);
ALTER TABLE Ciclistas ADD CONSTRAINTS CK_CICLISTAS_CATEGORIA CHECK(categoria>=1 AND categoria<=5);

ALTER TABLE Versiones ADD CONSTRAINTS CK_VERSIONES_ID CHECK(id_version >= 1 and id_version <=99999);
ALTER TABLE Versiones ADD CONSTRAINTS CK_VERSIONES_CARRERA CHECK(carrera = UPPER(carrera) and REGEXP_LIKE (carrera,'^[A-Z0-9]*$' ));
ALTER TABLE EsOrganizador ADD CONSTRAINTS CK_ESORGANIZADOR_EMPRESA CHECK (empresa>=1 and empresa<=99999);
ALTER TABLE EsOrganizador ADD CONSTRAINTS CK_ESORGANIZADOR_VERSION CHECK (version>=1 and version<=99999);
ALTER TABLE Participa ADD CONSTRAINTS CK_PARTICIPA_CICLISTA CHECK (ciclista>=1 and ciclista<=99999);
ALTER TABLE Participa ADD CONSTRAINTS CK_PARTICIPA_VERSION CHECK (version>=1 and version<=99999);

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

/* CICLO 1: Únicas */
ALTER TABLE Registros ADD CONSTRAINT UK_REGISTROS UNIQUE (comentario);

/*CICLO 1: Foráneas*/

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
ALTER TABLE Registros ADD CONSTRAINT FK_REGISTROS_VERSION FOREIGN KEY(version)REFERENCES Versiones(id_version);
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_PUNTOINICIAL FOREIGN KEY(puntoInicial)REFERENCES Puntos(id_punto);
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_PUNTOFINAL FOREIGN KEY(puntoFinal)REFERENCES Puntos(id_punto);
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_VERSION FOREIGN KEY(version)REFERENCES Versiones(id_version);
ALTER TABLE Puntos ADD CONSTRAINT FK_PUNTOS_ FOREIGN KEY(carrera)REFERENCES Carreras(codigo);

/* CICLO 1: PoblarNoOK (2) */

/*Deseamos validar que el documento sea mayor a 1111111111
  Está protegida por la restricción CK_MIEMBROS_IDN*/
  /*
INSERT INTO Miembros VALUES (2,'CC',10000,'ARGENTINA','miguelfuquene@yahoo.com');

/*Deseamos validar que el correo siga este formato ^[^@]+@[^@]+\.[a-zA-Z]{2,}$
  Está protediga por la restricción CK_MIEMBROS_CORREO*/
  /*
INSERT INTO Miembros VALUES (2,'CC',2111111111,'ARGENTINA','miguelfuqueneyahoo.com');

/*Deseamos validar que la periodicidad de la carrera sea 'A' O 'S'
  Está protediga por la restricción CK_CARRERAS_PERIODICIDAD*/
  /*
INSERT INTO Carreras VALUES ('CR003','Tour de Francia','FRANCIA',1,'C');

/*Deseamos validar que la distancia sea positiva
  Está protedida por la restricción CK_PUNTOS_DISTANCIA*/
  /*
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','M',-647.98,5,'CR001');

/*Deseamos validar que el tipo de segmento sea 'C' , 'M' O 'L'
  Está protediga por la restricción CK_SEGMENTOS_TIPOSEGMENTO*/
  /*
INSERT INTO Segmentos VALUES('descanso','H','CR001P1','CR001P2',1);

/* CICLO 1: PoblarNoOK (3) */

/* Deseamos validar que el pais sea ingresado en mayusculas y pueda tener espacios
   Protegida por la restricción CK_CARRERAS_PAIS*//*
INSERT INTO Carreras VALUES ('CR001','Tour de Francia','Francia ',1,'A');

/*Deseamos validar que el tipo de documento sea 'CC' , 'CE' O 'NT'
  Está protegida por la restricción CK_MIEMBROS_IDT*//*
INSERT INTO Miembros VALUES (2,'CE',10000,'ARGENTINA','miguelfuquene@yahoo.com');

/* Deseamos validar que el tiempo de un registro sea mayor a 0 y menor a 999999999
   Está protegida por la restricción CK_REGISTROS_DURACION*//*
INSERT INTO Registros VALUES (1,TO_DATE('1999/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),-1000,5,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','A','www.ineosfotos.pdf','Excelente',2,'rocoso',1);

/* Deseamos validar que el tipo de un punto sea 'L' , 'H', 'A' , 'M' , 'V' O 'C'
   Está protedido por la restricción CK_PUNTOS_TIPO 
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','T',2.2,5,'CR001');

/* Deseamos validar que el codigo de una carrera solo puede contener letras y números. Se almacena en mayuscula.
   Está protegido por la restricción CK_CARRERAS_CODIGO 
INSERT INTO Carreras VALUES ('Cr001+*-','Tour de Francia','FRANCIA',1,'A');

/* E. Construcción : consultando */ 

/* CICLO 1: Consultar los cinco segmentos con tiempos mas cortos */ 

SELECT v.nombre as nombreVersion,nombres as nombreCiclista,posicion,tiempo
FROM Ciclistas c , Registros r , Versiones v , Personas p
WHERE c.id = p.id AND r.ciclista = c.id AND r.version = v.id_version AND ROWNUM<=5
ORDER BY tiempo ASC;

/* CICLO 1: Consultar puntos de una carrera */

SELECT DISTINCT v.nombre as nombreVersion , p.nombre as nombrePunto ,tipo,distancia,tiempoLimite
FROM Puntos p,Carreras c,Versiones v
WHERE p.carrera = c.codigo and v.carrera = c.codigo
ORDER BY distancia;

/* CICLO 1: Consultar ciclistas que han obtenido la primera posicion en un segmento */

SELECT p.nombres as nombreCiclista , v.nombre as nombreVersion , s.nombre as nombreSegmento , r.fecha , r.tiempo
FROM Personas p , Ciclistas c , Registros r , Segmentos s , Versiones v
WHERE p.id = c.id AND c.id = r.ciclista AND s.nombre = r.segmento AND r.version = v.id_version AND s.version = v.id_version AND posicion = 1
ORDER BY tiempo;

/* CICLO 1 : Consultar Ciclistas con más participaciones en versiones de carreras */

SELECT p.nombres , COUNT(v.nombre) as numeroParticipaciones
FROM Personas p , Ciclistas c , Versiones v , Participa p
WHERE p.id = c.id AND c.id = p.ciclista AND p.version = v.id_version
GROUP BY p.nombres
ORDER BY numeroParticipaciones;

/* F. Construcción: nuevamente poblando */

/* Un registro en la posición 1 para el corredor “Tin Tin” en la versión “19CO” de carrera
“LaRutaSabana”, segmento “Sisga” */
/*
INSERT INTO Carreras VALUES ('C0','LaRutaSabana','BOGOTA',1,'A');
INSERT INTO Versiones VALUES (19,'19CO',TO_DATE('2019/10/01','YYYY/MM/DD'),'C0');
INSERT INTO Miembros VALUES (10,'CC',1214308690,'COLOMBIA','tintin@gmail.com');
INSERT INTO Personas VALUES (10,'Tin Tin');
INSERT INTO Ciclistas VALUES (10,TO_DATE('1999/10/06','YYYY/MM/DD'),1);
INSERT INTO Participa VALUES (10,19);
INSERT INTO Puntos VALUES ('C0P2',2,'puntoH','H',5.2,20,'C0');
INSERT INTO Puntos VALUES ('C0P3',3,'puntoC','C',10.2,30,'C0');
INSERT INTO Segmentos VALUES('Sisga','C','C0P2','C0P3',1);
INSERT INTO Registros VALUES (5,TO_DATE('2019/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),10,1,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','B','www.sabanafotos.pdf','Descanso',10,'Sisga',19);

/*POBLANDO CON MOCKAROO*/

insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C0', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C1', 'Vuelta a España', 'HONDURAS', 3, 'S');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C2', 'Tour de Francia', 'AZERBAIJAN', 4, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C3', 'Tour de Francia', 'BRAZIL', 4, 'S');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C4', 'Vuelta a España', 'INDONESIA', 2, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C5', 'Tour de Francia', 'JAPAN', 4, 'S');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C6', 'Tour de Francia', 'NETHERLANDS', 4, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C7', 'Tour de Francia', 'UGANDA', 4, 'S');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C8', 'Tour de Francia', 'PHILIPPINES', 5, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C9', 'Tour de Francia', 'IRELAND', 1, 'S');

insert into Miembros (id, idt, idn, pais, correo ) values (1, 'NT', 953329366175922, 'CHINA', 'lkeneford0@sfgate.com');
insert into Miembros (id, idt, idn, pais, correo ) values (2, 'CC', 547779017598213, 'BELARUS', 'dfoskett1@typepad.com');
insert into Miembros (id, idt, idn, pais, correo ) values (3, 'CC', 917203705058155, 'INDONESIA', 'rheinssen2@go.com');
insert into Miembros (id, idt, idn, pais, correo ) values (4, 'CE', 924373512388602, 'LAOS', 'cbeverley3@google.es');
insert into Miembros (id, idt, idn, pais, correo ) values (5, 'CE', 240735276258424, 'CHINA', 'hpatterfield4@instagram.com');
insert into Miembros (id, idt, idn, pais, correo ) values (6, 'CC', 84330936945705, 'PHILIPPINES', 'cnewvill5@symantec.com');
insert into Miembros (id, idt, idn, pais, correo ) values (7, 'CE', 601327357790221, 'NORWAY', 'dhornung6@sphinn.com');
insert into Miembros (id, idt, idn, pais, correo ) values (8, 'NT', 228132058383003, 'NIGERIA', 'lleddie7@google.fr');
insert into Miembros (id, idt, idn, pais, correo ) values (9, 'CC', 633203286110267, 'COLOMBIA', 'hivanenkov8@dyndns.org');
insert into Miembros (id, idt, idn, pais, correo ) values (10, 'CE', 614807698886407, 'BRAZIL', 'gcumberbatch9@cloudflare.com');

insert into Personas (id, nombres) values (1, 'Biddy');
insert into Personas (id, nombres) values (2, 'Torrance');
insert into Personas (id, nombres) values (3, 'Esmaria');
insert into Personas (id, nombres) values (4, 'Jennie');
insert into Personas (id, nombres) values (5, 'Beitris');
insert into Personas (id, nombres) values (6, 'Hillier');
insert into Personas (id, nombres) values (7, 'Michaela');
insert into Personas (id, nombres) values (8, 'Berry');
insert into Personas (id, nombres) values (9, 'Berget');
insert into Personas (id, nombres) values (10, 'Fritz');

insert into Empresas (id, razonSocial, representante) values (1, 'Reba', 5);
insert into Empresas (id, razonSocial, representante) values (2, 'Elijah', 4);
insert into Empresas (id, razonSocial, representante) values (3, 'Zea', 9);
insert into Empresas (id, razonSocial, representante) values (4, 'Sherlocke', 10);
insert into Empresas (id, razonSocial, representante) values (5, 'Rolf', 1);
insert into Empresas (id, razonSocial, representante) values (6, 'Dame', 5);
insert into Empresas (id, razonSocial, representante) values (7, 'Robinia', 2);
insert into Empresas (id, razonSocial, representante) values (8, 'Elvin', 1);
insert into Empresas (id, razonSocial, representante) values (9, 'Gottfried', 3);
insert into Empresas (id, razonSocial, representante) values (10, 'Latrena', 10);

insert into Ciclistas (id, nacimiento, categoria ) values (1, '7/9/1994', 3);
insert into Ciclistas (id, nacimiento, categoria ) values (2, '9/14/1990', 1);
insert into Ciclistas (id, nacimiento, categoria ) values (3, '12/8/1988', 3);
insert into Ciclistas (id, nacimiento, categoria ) values (4, '4/30/1955', 2);
insert into Ciclistas (id, nacimiento, categoria ) values (5, '6/3/1953', 1);
insert into Ciclistas (id, nacimiento, categoria ) values (6, '8/23/1952', 1);
insert into Ciclistas (id, nacimiento, categoria ) values (7, '5/12/1964', 3);
insert into Ciclistas (id, nacimiento, categoria ) values (8, '3/31/1972', 3);
insert into Ciclistas (id, nacimiento, categoria ) values (9, '11/7/1995', 2);
insert into Ciclistas (id, nacimiento, categoria ) values (10, '1/25/1971', 3);

insert into Puntos (id_punto, nombre, orden, tipo, distancia, tiempoLimite, carrera) values ('C0P1','puntoA',7, 'L', 966508.62, 335922328, 'C4');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C0P2','puntoC', 80, 'L', 277983.11, 377972464, 'C8');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1P3','puntoD', 55, 'P', 286883.43, 622516403, 'C5');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1P4','puntoF', 56, 'P', 281272.85, 252775152, 'C3');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C2P5','puntoG', 77, 'H', 703632.76, 664964242, 'C6');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C2P9','puntoI', 3, 'M', 323928.34, 5379067, 'C3');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C3P6','puntoK', 61, 'H', 436763.48, 253686261, 'C2');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C7P9','puntoL', 43, 'L', 42993.54, 349240490, 'C4');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C8P4','puntoF', 90, 'P', 114799.87, 502156856, 'C0');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C6P9','puntoA', 75, 'V', 118485.99, 903682529, 'C4');

insert into Versiones (id_version, nombre, fecha, carrera) values (1, 'C019', '05/23/1992', 'C8');
insert into Versiones (id_version, nombre, fecha, carrera) values (2, 'C020', '07/08/1954', 'C9');
insert into Versiones (id_version, nombre, fecha, carrera) values (3, 'C114', '02/14/1987', 'C6');
insert into Versiones (id_version, nombre, fecha, carrera) values (4, 'C313', '12/07/1973', 'C9');
insert into Versiones (id_version, nombre, fecha, carrera) values (5, 'C512', '10/17/1996', 'C7');
insert into Versiones (id_version, nombre, fecha, carrera) values (6, 'C112', '05/19/1958', 'C6');
insert into Versiones (id_version, nombre, fecha, carrera) values (7, 'C610', '08/02/1969', 'C1');
insert into Versiones (id_version, nombre, fecha, carrera) values (8, 'C713', '02/20/1959', 'C1');
insert into Versiones (id_version, nombre, fecha, carrera) values (9, 'C910', '08/05/1962', 'C7');
insert into Versiones (id_version, nombre, fecha, carrera) values (10, 'C516', '01/23/1998', 'C7');

insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S1', 'C', 'C6P9', 'C1P4', 9);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V1S2', 'C', 'C1P3', 'C6P9', 8);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S6', 'M', 'C0P1', 'C7P9', 4);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S3', 'L', 'C0P2', 'C8P4', 3);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V1S8', 'C', 'C0P2', 'C8P4', 5);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V1S3', 'M', 'C3P6', 'C1P4', 2);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S5', 'C', 'C8P4', 'C2P5', 1);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V1S9', 'M', 'C2P5', 'C1P4', 10);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V4S6', 'C', 'C3P6', 'C3P6', 7);
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V9S8', 'L', 'C0P2', 'C6P9', 6);

insert into Participa (ciclista, version) values (3, 1);
insert into Participa (ciclista, version) values (4, 10);
insert into Participa (ciclista, version) values (2, 8);
insert into Participa (ciclista, version) values (5, 1);
insert into Participa (ciclista, version) values (1, 5);
insert into Participa (ciclista, version) values (5, 8);
insert into Participa (ciclista, version) values (6, 9);
insert into Participa (ciclista, version) values (8, 6);
insert into Participa (ciclista, version) values (3, 5);
insert into Participa (ciclista, version) values (2, 5);

insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (1, TO_DATE('1999/10/06 14:10:23','YYYY/MM/DD HH24:MI:SS'), 832599376, 22174, 'www.sabanafotos.pdf', 'A', 'www.cisco.gif', 'excelente', 7, 'V1S9', 6);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (2, TO_DATE('1998/04/07 15:10:23','YYYY/MM/DD HH24:MI:SS'), 623579437, 63747, null, 'B', 'www.mbda.pdf', 'riesgoso', 3, 'V9S8', 7);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (3, TO_DATE('1997/05/06 16:10:23','YYYY/MM/DD HH24:MI:SS'), 788828997, 35315, null, 'M', 'www.twitter.pdf', 'regular', 3, 'V9S8', 4);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (4, TO_DATE('1965/10/04 17:10:23','YYYY/MM/DD HH24:MI:SS'), 454199313, 9500, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'B', 'www.astana.pdf', 'cuidadoso', 6, 'V4S6', 2);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (5, TO_DATE('1954/07/03 18:10:23','YYYY/MM/DD HH24:MI:SS'), 254350296, 69959, null, 'B', 'www.poob.pdf', 'bueno', 6, 'V9S8', 1);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (6, TO_DATE('2001/10/02 07:10:23','YYYY/MM/DD HH24:MI:SS'), 946098495, 7015, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'M', 'www.ineos.gif', 'rocoso', 3, 'V1S2', 3);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (7, TO_DATE('2010/09/04 06:10:23','YYYY/MM/DD HH24:MI:SS'), 357033105, 6453, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'A', 'www.astana.pdf', 'dificil', 3, 'V1S3', 10);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (8, TO_DATE('1999/08/05 03:10:23','YYYY/MM/DD HH24:MI:SS'), 71639036, 69808, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'B', 'www.twitter.pdf', 'pesimo', 1, 'V4S6', 1);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (9, TO_DATE('1967/11/07 01:10:23','YYYY/MM/DD HH24:MI:SS'), 209879245, 30853, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'A', 'www.movistar.pdf', 'malo', 5, 'V5S6', 1);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, fotos, comentario, ciclista, segmento, version) values (10, TO_DATE('1777/12/08 02:10:23','YYYY/MM/DD HH24:MI:SS'), 763708868, 6932, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'B', 'www.poob.pdf', 'aceptable', 7, 'V5S6', 8);

insert into EsOrganizador (empresa, version) values (3, 8);
insert into EsOrganizador (empresa, version) values (6, 5);
insert into EsOrganizador (empresa, version) values (5, 6);
insert into EsOrganizador (empresa, version) values (9, 7);
insert into EsOrganizador (empresa, version) values (3, 7);
insert into EsOrganizador (empresa, version) values (3, 5);
insert into EsOrganizador (empresa, version) values (10, 10);
insert into EsOrganizador (empresa, version) values (5, 9);
insert into EsOrganizador (empresa, version) values (8, 10);
insert into EsOrganizador (empresa, version) values (6, 2);


insert into PropiedadDe (miembro, carrera, porcentaje) values (6, 'C3', 94.85);
insert into PropiedadDe (miembro, carrera, porcentaje) values (8, 'C3', 53.3);
insert into PropiedadDe (miembro, carrera, porcentaje) values (8, 'C0', 17.11);
insert into PropiedadDe (miembro, carrera, porcentaje) values (4, 'C4', 53.02);
insert into PropiedadDe (miembro, carrera, porcentaje) values (3, 'C3', 46.88);
insert into PropiedadDe (miembro, carrera, porcentaje) values (7, 'C5', 50.42);
insert into PropiedadDe (miembro, carrera, porcentaje) values (10, 'C8', 83.87);
insert into PropiedadDe (miembro, carrera, porcentaje) values (2, 'C4', 33.28);
insert into PropiedadDe (miembro, carrera, porcentaje) values (10, 'C1', 26.11);
insert into PropiedadDe (miembro, carrera, porcentaje) values (1, 'C1', 11.18);