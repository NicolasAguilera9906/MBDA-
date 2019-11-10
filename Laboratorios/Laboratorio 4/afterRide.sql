
/* C. ConstrucciÃ³n: creando */

/* CICLO 1: Tablas*/

CREATE TABLE Puntos(id_punto VARCHAR( 20 ) NOT NULL,orden NUMBER( 2 ) NOT NULL , nombre VARCHAR( 10 ) NOT NULL ,tipo CHAR( 1 ) NOT NULL,distancia NUMBER( 8,2 ) NOT NULL ,tiempoLimite NUMBER( 9 ) , carrera VARCHAR2( 20 ) NOT NULL) ;
CREATE TABLE Segmentos( nombre VARCHAR( 10 )NOT NULL,tipo CHAR( 1 )NOT NULL,puntoInicial VARCHAR( 20 ) NOT NULL, puntoFinal VARCHAR( 20 ) NOT NULL,version NUMBER( 7 ) NOT NULL ) ;
CREATE TABLE Registros(numero NUMBER( 5 ) NOT NULL, fecha DATE NOT NULL ,tiempo NUMBER( 9 ) NOT NULL ,posicion NUMBER( 5 ) NOT NULL ,revision VARCHAR2( 500 ) ,dificultad CHAR( 1 ) NOT NULL,comentario VARCHAR( 20 ),ciclista NUMBER( 5 ) NOT NULL,segmento VARCHAR2( 10 ) NOT NULL, version NUMBER(5) NOT NULL ); 

CREATE TABLE Carreras(codigo VARCHAR2( 20 ) NOT NULL ,nombre VARCHAR2( 30 ) ,pais VARCHAR2( 15 ) , categoria NUMBER( 1 ) , periodicidad CHAR( 1 ) );
CREATE TABLE PropiedadDe(miembro NUMBER( 5 ) NOT NULL ,carrera VARCHAR2( 20 ) NOT NULL, porcentaje NUMBER( 5, 2 ) NOT NULL );

CREATE TABLE Miembros(id NUMBER( 5 ) NOT NULL ,idt CHAR( 2 ) NOT NULL ,idn NUMBER( 15 )NOT NULL ,pais CHAR( 15 ) NOT NULL,correo VARCHAR2( 30 ) NOT NULL );
CREATE TABLE Personas( id NUMBER( 5 ) NOT NULL ,nombres VARCHAR2( 50 ) NOT NULL ) ;
CREATE TABLE Empresas(id NUMBER( 5 ) NOT NULL ,razonSocial VARCHAR2( 30 ) NOT NULL , representante NUMBER( 5 ) NOT NULL); 
CREATE TABLE Ciclistas(id NUMBER( 5 ) NOT NULL ,nacimiento DATE NOT NULL ,categoria NUMBER( 1 ) NOT NULL );

CREATE TABLE Versiones ( id_version NUMBER( 5 ) NOT NULL ,nombre VARCHAR2( 5 ) NOT NULL  ,fecha DATE NOT NULL ,carrera VARCHAR2( 20 ) NOT NULL);
CREATE TABLE Participa( ciclista NUMBER( 5 ) NOT NULL , version NUMBER( 7 ) NOT NULL);
CREATE TABLE EsOrganizador( empresa NUMBER( 5 ) NOT NULL  , version NUMBER( 7 ) NOT NULL  );
CREATE TABLE Fotos(direccion VARCHAR2(20)NOT NULL,registro NUMBER(5)NOT NULL);

-- CICLO 1: XTablas 

/*DROP TABLE PropiedadDe;
DROP TABLE EsOrganizador;
DROP TABLE Fotos;
DROP TABLE Registros;
DROP TABLE Participa;
DROP TABLE Segmentos;
DROP TABLE Versiones;
DROP TABLE Puntos;
DROP TABLE Ciclistas;
DROP TABLE Empresas;
DROP TABLE Personas;
DROP TABLE Miembros;
DROP TABLE Carreras;*/




/* D. ConstrucciÃ³n: poblando  */ 

/* CICLO 1: PoblarOK (1) */

--CRUD MIEMBROS--

INSERT INTO Miembros VALUES (1,'CC',1014308690,'COLOMBIA','nicolasaguilera@gmail.com');
INSERT INTO Personas VALUES (1,'Nicolas Aguilera');

INSERT INTO Miembros VALUES (2,'CC',1000658594,'ARGENTINA','miguelfuquene@yahoo.com');
INSERT INTO Personas VALUES (12,'Miguel Fuquene');
INSERT INTO Ciclistas VALUES (12,TO_DATE('1999/10/06','YYYY/MM/DD'),2);

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

INSERT INTO Versiones VALUES (1,'20191',TO_DATE('1999/10/01','YYYY/MM/DD'),'CR001');
INSERT INTO Puntos VALUES ('CR001P1',3,'puntoh','H',10.2,30,'CR001');
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','M',2.2,5,'CR001');
INSERT INTO Segmentos VALUES('montaÃ±a','M','CR001P1','CR001P2',1);
INSERT INTO Registros VALUES (1,TO_DATE('1999/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),10,1,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','A','Excelente',2,'montaÃ±a',1);

-- CRUD VERSION ---

INSERT INTO Versiones VALUES (2,'20191',TO_DATE('2019/10/01','YYYY/MM/DD'),'CR004');
INSERT INTO Carreras VALUES ('CR004','Tour de Francia','FRANCIA',1,'A');

INSERT INTO Versiones VALUES (3,'20201',TO_DATE('2020/10/01','YYYY/MM/DD'),'CR005');
INSERT INTO Carreras VALUES ('CR005','Giro de Italia','ITALIA',2,'A');

INSERT INTO Versiones VALUES (4,'20211',TO_DATE('2021/10/01','YYYY/MM/DD'),'CR006');
INSERT INTO Carreras VALUES ('CR005','Vuelta a EspaÃ±a','ESPAÃ‘A',3,'B');

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

DELETE FROM PropiedadDe;
DELETE FROM EsOrganizador;
DELETE FROM Fotos;
DELETE FROM Registros;
DELETE FROM Participa;
DELETE FROM Segmentos;
DELETE FROM Versiones;
DELETE FROM Puntos;
DELETE FROM Ciclistas;
DELETE FROM Empresas;
DELETE FROM Personas;
DELETE FROM Miembros;
DELETE FROM Carreras;

/* D. ConstrucciÃ³n: protegiendo */ 

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
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_CICLISTA CHECK(ciclista>=1 AND ciclista <= 99999);
ALTER TABLE Registros ADD CONSTRAINT CK_REGISTROS_VERSION CHECK(version >= 1 and version <=99999);
ALTER TABLE Fotos ADD CONSTRAINT CK_FOTOS_DIRECCION CHECK(direccion LIKE 'www.%' and (direccion LIKE '%.pdf' OR direccion LIKE '%.gif'));

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
ALTER TABLE Fotos ADD CONSTRAINT PK_FOTOS PRIMARY KEY(direccion);

/* CICLO 1: Ãšnicas */
ALTER TABLE Registros ADD CONSTRAINT UK_REGISTROS UNIQUE (comentario);

/*CICLO 1: ForÃ¡neas*/

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

/* CICLO 1: PoblarNoOK (2) */

/*Deseamos validar que el documento sea mayor a 1111111111
  EstÃ¡ protegida por la restricciÃ³n CK_MIEMBROS_IDN*/
  /*
INSERT INTO Miembros VALUES (2,'CC',10000,'ARGENTINA','miguelfuquene@yahoo.com');

/*Deseamos validar que el correo siga este formato ^[^@]+@[^@]+\.[a-zA-Z]{2,}$
  EstÃ¡ protediga por la restricciÃ³n CK_MIEMBROS_CORREO*/
  /*
INSERT INTO Miembros VALUES (2,'CC',2111111111,'ARGENTINA','miguelfuqueneyahoo.com');

/*Deseamos validar que la periodicidad de la carrera sea 'A' O 'S'
  EstÃ¡ protediga por la restricciÃ³n CK_CARRERAS_PERIODICIDAD*/
  /*
INSERT INTO Carreras VALUES ('CR003','Tour de Francia','FRANCIA',1,'C');

/*Deseamos validar que la distancia sea positiva
  EstÃ¡ protedida por la restricciÃ³n CK_PUNTOS_DISTANCIA*/
  /*
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','M',-647.98,5,'CR001');

/*Deseamos validar que el tipo de segmento sea 'C' , 'M' O 'L'
  EstÃ¡ protediga por la restricciÃ³n CK_SEGMENTOS_TIPOSEGMENTO*/
  /*
INSERT INTO Segmentos VALUES('descanso','H','CR001P1','CR001P2',1);

/* CICLO 1: PoblarNoOK (3) */

/* Deseamos validar que el pais sea ingresado en mayusculas y pueda tener espacios
   Protegida por la restricciÃ³n CK_CARRERAS_PAIS*//*
INSERT INTO Carreras VALUES ('CR001','Tour de Francia','Francia ',1,'A');

/*Deseamos validar que el tipo de documento sea 'CC' , 'CE' O 'NT'
  EstÃ¡ protegida por la restricciÃ³n CK_MIEMBROS_IDT*//*
INSERT INTO Miembros VALUES (2,'CE',10000,'ARGENTINA','miguelfuquene@yahoo.com');

/* Deseamos validar que el tiempo de un registro sea mayor a 0 y menor a 999999999
   EstÃ¡ protegida por la restricciÃ³n CK_REGISTROS_DURACION*//*
INSERT INTO Registros VALUES (1,TO_DATE('1999/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),-1000,5,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','A','www.ineosfotos.pdf','Excelente',2,'rocoso',1);

/* Deseamos validar que el tipo de un punto sea 'L' , 'H', 'A' , 'M' , 'V' O 'C'
   EstÃ¡ protedido por la restricciÃ³n CK_PUNTOS_TIPO 
INSERT INTO Puntos VALUES ('CR001P2',4,'puntom','T',2.2,5,'CR001');

/* Deseamos validar que el codigo de una carrera solo puede contener letras y nÃºmeros. Se almacena en mayuscula.
   EstÃ¡ protegido por la restricciÃ³n CK_CARRERAS_CODIGO 
INSERT INTO Carreras VALUES ('Cr001+*-','Tour de Francia','FRANCIA',1,'A');

/* E. ConstrucciÃ³n : consultando */ 

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

/* CICLO 1 : Consultar Ciclistas con mÃ¡s participaciones en versiones de carreras */

SELECT p.nombres , COUNT(v.nombre) as numeroParticipaciones
FROM Personas p , Ciclistas c , Versiones v , Participa p
WHERE p.id = c.id AND c.id = p.ciclista AND p.version = v.id_version
GROUP BY p.nombres
ORDER BY numeroParticipaciones;

/* F. ConstrucciÃ³n: nuevamente poblando */

/* Un registro en la posiciÃ³n 1 para el corredor â€œTin Tinâ€? en la versiÃ³n â€œ19COâ€? de carrera
â€œLaRutaSabanaâ€?, segmento â€œSisgaâ€? */

INSERT INTO Carreras VALUES ('C0','LaRutaSabana','BOGOTA',1,'A');
INSERT INTO Versiones VALUES (19,'19CO',TO_DATE('2019/10/01','YYYY/MM/DD'),'C0');
INSERT INTO Miembros VALUES (13,'CC',1214308690,'COLOMBIA','tintin@gmail.com');
INSERT INTO Personas VALUES (13,'Tin Tin');
INSERT INTO Ciclistas VALUES (13,TO_DATE('1999/10/06','YYYY/MM/DD'),1);
INSERT INTO Participa VALUES (13,19);
INSERT INTO Puntos VALUES ('C0P2',2,'puntoH','H',5.2,20,'C0');
INSERT INTO Puntos VALUES ('C0P3',3,'puntoC','C',10.2,30,'C0');
INSERT INTO Segmentos VALUES('Sisga','C','C0P2','C0P3',19);
INSERT INTO Registros VALUES (30,TO_DATE('2019/10/06 13:10:23','YYYY/MM/DD HH24:MI:SS'),10,1,'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10','B','Descanso',13,'Sisga',19);
INSERT INTO Fotos VALUES('www.movistar.gif',30);
/*POBLANDO CON MOCKAROO*/

insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('CR0', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C1', 'Vuelta a EspaÃ±a', 'HONDURAS', 3, 'S');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C2', 'Tour de Francia', 'AZERBAIJAN', 4, 'A');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C3', 'Tour de Francia', 'BRAZIL', 4, 'S');
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C4', 'Vuelta a EspaÃ±a', 'INDONESIA', 2, 'A');
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
insert into Miembros (id, idt, idn, pais, correo ) values (10, 'CC', 633203286110267, 'ITALIA', 'gmail@dyndns.org');
insert into Miembros (id, idt, idn, pais, correo ) values (11, 'CE', 614807698886407, 'BRAZIL', 'gcumberbatch9@cloudflare.com');
insert into Miembros (id, idt, idn, pais, correo ) values (21, 'CE', 614807698886407, 'MEXICO', 'gcumbertbatch9@cloudflare.com');

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
insert into Personas (id, nombres) values (21, 'Marie');

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

insert into Ciclistas (id, nacimiento, categoria ) values (1, TO_DATE('1999/10/02' ,'YYYY/MM/DD'), 3);
insert into Ciclistas (id, nacimiento, categoria ) values (2, TO_DATE('1998/11/03' ,'YYYY/MM/DD'), 1);
insert into Ciclistas (id, nacimiento, categoria ) values (3, TO_DATE('1997/10/04' ,'YYYY/MM/DD'), 3);
insert into Ciclistas (id, nacimiento, categoria ) values (4, TO_DATE('1996/10/01' ,'YYYY/MM/DD'), 2);
insert into Ciclistas (id, nacimiento, categoria ) values (5, TO_DATE('1995/05/01' ,'YYYY/MM/DD'), 1);
insert into Ciclistas (id, nacimiento, categoria ) values (6, TO_DATE('1994/10/07' ,'YYYY/MM/DD'), 1);
insert into Ciclistas (id, nacimiento, categoria ) values (7, TO_DATE('1999/10/01' ,'YYYY/MM/DD'), 3);
insert into Ciclistas (id, nacimiento, categoria ) values (8, TO_DATE('1999/04/12' ,'YYYY/MM/DD'), 3);
insert into Ciclistas (id, nacimiento, categoria ) values (21, TO_DATE('2000/10/01' ,'YYYY/MM/DD'), 2);
insert into Ciclistas (id, nacimiento, categoria ) values (10, TO_DATE('1999/10/04' ,'YYYY/MM/DD'), 3);

insert into Puntos (id_punto, nombre, orden, tipo, distancia, tiempoLimite, carrera) values ('C0P1','puntoA',7, 'L', 966508.62, 335922328, 'C4');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C0PU2','puntoC', 80, 'L', 277983.11, 377972464, 'C8');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1P3','puntoD', 55, 'P', 286883.43, 622516403, 'C5');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1P4','puntoF', 56, 'P', 281272.85, 252775152, 'C3');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C2P5','puntoG', 77, 'H', 703632.76, 664964242, 'C6');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C2P9','puntoI', 3, 'M', 323928.34, 5379067, 'C3');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C3P6','puntoK', 61, 'H', 436763.48, 253686261, 'C2');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C7P9','puntoL', 43, 'L', 42993.54, 349240490, 'C4');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C8P4','puntoF', 90, 'P', 114799.87, 502156856, 'C0');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C6P9','puntoA', 75, 'V', 118485.99, 903682529, 'C4');


insert into Versiones (id_version, nombre, fecha, carrera) values (1, 'C019',  TO_DATE('1999/10/01' ,'YYYY/MM/DD'), 'C8');
insert into Versiones (id_version, nombre, fecha, carrera) values (2, 'C020',  TO_DATE('1998/11/02' ,'YYYY/MM/DD'), 'C9');
insert into Versiones (id_version, nombre, fecha, carrera) values (3, 'C114',  TO_DATE('1997/12/03' ,'YYYY/MM/DD'), 'C6');
insert into Versiones (id_version, nombre, fecha, carrera) values (4, 'C313',  TO_DATE('1996/01/04' ,'YYYY/MM/DD'), 'C9');
insert into Versiones (id_version, nombre, fecha, carrera) values (5, 'C512',  TO_DATE('1995/02/05' ,'YYYY/MM/DD'), 'C7');
insert into Versiones (id_version, nombre, fecha, carrera) values (6, 'C112',  TO_DATE('1994/03/06' ,'YYYY/MM/DD'), 'C6');
insert into Versiones (id_version, nombre, fecha, carrera) values (7, 'C610',  TO_DATE('1993/04/07' ,'YYYY/MM/DD'), 'C1');
insert into Versiones (id_version, nombre, fecha, carrera) values (8, 'C713',  TO_DATE('1992/05/08' ,'YYYY/MM/DD'), 'C1');
insert into Versiones (id_version, nombre, fecha, carrera) values (9, 'C910',  TO_DATE('1991/06/09' ,'YYYY/MM/DD'), 'C7');
insert into Versiones (id_version, nombre, fecha, carrera) values (10, 'C516', TO_DATE('1999/07/06' ,'YYYY/MM/DD'), 'C7');

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

insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (1, TO_DATE('1999/10/06 14:10:23','YYYY/MM/DD HH24:MI:SS'), 832599376, 22174, 'duro', 'A', 'excelente', 7, 'V1S9', 6);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (2, TO_DATE('1998/04/07 15:10:23','YYYY/MM/DD HH24:MI:SS'), 623579437, 63747, null, 'B', 'riesgoso', 3, 'V9S8', 7);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (3, TO_DATE('1997/05/06 16:10:23','YYYY/MM/DD HH24:MI:SS'), 788828997, 35315, null, 'M', 'regular', 3, 'V9S8', 4);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (4, TO_DATE('1965/10/04 17:10:23','YYYY/MM/DD HH24:MI:SS'), 454199313, 9500, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'B', 'cuidadoso', 6, 'V4S6', 2);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (5, TO_DATE('1954/07/03 18:10:23','YYYY/MM/DD HH24:MI:SS'), 254350296, 69959, null, 'B', 'bueno', 6, 'V9S8', 1);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (6, TO_DATE('2001/10/02 07:10:23','YYYY/MM/DD HH24:MI:SS'), 946098495, 7015, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'M', 'rocoso', 3, 'V1S2', 3);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (7, TO_DATE('2010/09/04 06:10:23','YYYY/MM/DD HH24:MI:SS'), 357033105, 6453, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'A', 'dificil', 3, 'V1S3', 10);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (8, TO_DATE('1999/08/05 03:10:23','YYYY/MM/DD HH24:MI:SS'), 71639036, 69808, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'B',  'pesimo', 1, 'V4S6', 1);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (9, TO_DATE('1967/11/07 01:10:23','YYYY/MM/DD HH24:MI:SS'), 209879245, 30853, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'A',  'malo', 5, 'V5S6', 1);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (10, TO_DATE('1777/12/08 02:10:23','YYYY/MM/DD HH24:MI:SS'), 763708868, 6932, 'duro : 10km,9km,3m/s,3m/s,9,10 facil : 10km,9km,3m/s,3m/s,9,10 descenso : 10km,9km,3m/s,3m/s,9,10', 'B',  'aceptable', 7, 'V5S6', 8);

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

DELETE FROM PropiedadDe;
DELETE FROM EsOrganizador;
DELETE FROM Fotos;
DELETE FROM Registros;
DELETE FROM Participa;
DELETE FROM Segmentos;
DELETE FROM Versiones;
DELETE FROM Puntos;
DELETE FROM Ciclistas;
DELETE FROM Empresas;
DELETE FROM Personas;
DELETE FROM Miembros;
DELETE FROM Carreras;

                                                                --Laboratorio 04--

                                                        --PUNTO DOS. PREPARANDO CRUDs--

                                                            -- Registrar resultado --

--UKS--
/*No pueden quedar dos ciclistas con la misma posición. */ 
ALTER TABLE Registros ADD CONSTRAINT UK_REGISTRO_POSICION UNIQUE(posicion);
/* Un ciclista solo puede tener un único registro en un segmento. */
ALTER TABLE Registros ADD CONSTRAINT UK_REGISTRO_CICLISTA_SEGMENTO UNIQUE(ciclista,segmento);

--ACCIONES--
ALTER TABLE Registros DROP CONSTRAINT FK_REGISTROS_CICLISTA;
ALTER TABLE Registros ADD CONSTRAINT FK_REGISTROS_CICLISTA FOREIGN KEY(ciclista)REFERENCES Ciclistas(id) ON DELETE CASCADE;
ALTER TABLE Registros DROP CONSTRAINT FK_REGISTROS_SEGMENTO;
ALTER TABLE Registros ADD CONSTRAINT FK_REGISTROS_SEGMENTO FOREIGN KEY(segmento)REFERENCES Segmentos(nombre) ON DELETE CASCADE;
--ACCIONES OK--
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C6', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1P4','ps', 56, 'H', 281272.85, 252775152, 'C6');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C2P5','ptata', 77, 'H', 703632.76, 664964242, 'C6');
insert into Versiones (id_version, nombre, fecha, carrera) values (6, 'PEPE',  TO_DATE('1994/03/06' ,'YYYY/MM/DD'), 'C6');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V1S9', 'M', 'C2P5', 'C1P4', 6);
insert into Miembros (id, idt, idn, pais, correo ) values (1, 'CE', 614807698886407, 'MEXICO', 'gcumbertbatch9@cloudflare.com');
insert into Personas (id, nombres) values (1, 'Biddy');
insert into Ciclistas (id, nacimiento, categoria ) values (1, TO_DATE('1999/10/02' ,'YYYY/MM/DD'), 3);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (1, TO_DATE('1999/10/06 14:10:23','YYYY/MM/DD HH24:MI:SS'), 832599376, 22174, 'duro', 'A', 'excelente', 1, 'V1S9', 6);
DELETE FROM registros where numero =1;

--TRIGGERS--
/*  El número y la fecha se asignan automáticamente */ 
CREATE OR REPLACE TRIGGER TG_IN_NUMERO_FECHA
    BEFORE INSERT ON Registros
    FOR EACH ROW
    DECLARE 
    numx NUMBER;
    xfecha DATE;
    actual DATE;
    BEGIN
        SELECT COALESCE(MAX(numero),0) into numx 
        FROM Registros;
        :new.numero := numx+1;
        
        SELECT sysdate into actual
        FROM dual;
        
        SELECT  COALESCE(MAX(fecha),actual) into xfecha
        FROM Registros;
        :new.fecha  := xfecha+1;
    END;
    /
--DISPARADOR OK --
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (10000, TO_DATE('1999/10/06 14:10:23','YYYY/MM/DD HH24:MI:SS'), 832599376, 22174, 'duro', 'A', 'excelente', 1, 'V1S9', 6);
DROP TRIGGER TG_IN_NUMERO_FECHA;

/*Los datos a modificar son la revisión Y el comentario.*/
CREATE OR REPLACE TRIGGER TG_MO_REGISTROS
    BEFORE UPDATE ON Registros
    FOR EACH ROW
    BEGIN
       IF  :old.numero != :new.numero  or  :old.fecha != :new.fecha or :old.tiempo != :new.tiempo or :old.posicion!=:new.posicion or :old.segmento != :new.segmento or :old.ciclista != :new.ciclista or :old.dificultad != :new.dificultad or :old.segmento != :new.segmento or :old.version!=:new.version or :old.ciclista!=:new.ciclista THEN
            RAISE_APPLICATION_ERROR(-20055,'Los datos a modificar son la revisión, las fotos y el comentario.');
       END IF;
    END;
    /
--DISPARADOR OK--
UPDATE registros SET revision= 'hola' WHERE numero=1;
UPDATE registros SET comentario= 'exce' WHERE numero=1;
--DISPARADOR NO OK--
/*UPDATE registros SET posicion = 5 WHERE numero=1;
UPDATE registros SET dificultad = 'C' WHERE numero=1;
UPDATE registros SET segmento= 'a' WHERE numero=1;*/
DROP TRIGGER TG_MO_REGISTROS;

/*Sólo es posible eliminar un registro si no ha pasado mas de un dia desde que se creo.*/
CREATE OR REPLACE TRIGGER TG_EL_REGISTROS
    BEFORE DELETE ON Registros
    FOR EACH ROW
    DECLARE
    actual DATE;
    BEGIN
        select sysdate into actual
        from dual;
        IF :old.fecha < actual-1 OR :old.fecha > actual+1 THEN
            RAISE_APPLICATION_ERROR(-20055,'Ha pasado más de un dia desde la creacion del registro');
        END IF;
    END;
    /
--DISPARADOR OK--
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C90', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('PT','puntoF', 56, 'H', 281272.85, 252775152, 'C6');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('PI','puntoG', 77, 'H', 703632.76, 664964242, 'C6');
insert into Versiones (id_version, nombre, fecha, carrera) values (60, 'C112',  TO_DATE('1994/03/06' ,'YYYY/MM/DD'), 'C90');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('CACO', 'M', 'PT', 'PI', 60);
insert into Miembros (id, idt, idn, pais, correo ) values (3, 'CE', 614807698886407, 'MEXICO', 'gcumbertbatch9@cloudflare.com');
insert into Personas (id, nombres) values (3, 'Biddy');
insert into Ciclistas (id, nacimiento, categoria ) values (3, TO_DATE('1999/10/02' ,'YYYY/MM/DD'), 3);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (3, sysdate, 832599376, 243, 'duro', 'A', 'ele', 3, 'CACO', 7);
DELETE FROM Registros WHERE numero = 3;
--DISPARADOR NO OK --
/*insert into Miembros (id, idt, idn, pais, correo ) values (4, 'CE', 614807698886407, 'MEXICO', 'gcumbertbatch9@cloudflare.com');
insert into Personas (id, nombres) values (4, 'Biddy');
insert into Ciclistas (id, nacimiento, categoria ) values (4, TO_DATE('1999/10/02' ,'YYYY/MM/DD'), 3);
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclista, segmento, version) values (4, TO_DATE('1999/10/02' ,'YYYY/MM/DD'), 832599376, 3, 'duro', 'A', 'el', 4, 'CACO', 60);
DELETE FROM Registros WHERE numero = 4;*/
DROP TRIGGER TG_EL_REGISTROS;
                                                            -- Mantener Carrera --
-- TUPLAS --
/*La distancia siempre dee ser mayor a 1km */
ALTER TABLE puntos ADD CONSTRAINT CK_PUNTOS_DISTANCIAMINIMA CHECK(distancia > 1);
--TUPLAS OK--
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C10', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1K8','puntoF', 56, 'H', 281272.85, 252775152, 'C10');
--TUPLAS NO OK--
/*insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1K5','puntoF', 56, 'H', -3, 252775152, 'C10');*/

/*La velodiad maxima en cicla es de 100 km / hora*/
ALTER TABLE puntos ADD CONSTRAINT CK_PUNTOS_VELOCIDAD CHECK(distancia/tiempoLimite <= 100);
--TUPLAS OK--
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1K1','puntoO', 56, 'H', 20, 2, 'C10');
--TUPLAS NO OK--
/*insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1K3','punt', 56, 'H', 300, 1, 'C10');*/

-- UK --
/* El nombre del punto no se debe repetir dentro de una carrera */ 
ALTER TABLE puntos ADD CONSTRAINT UK_PUNTOS_NOMBRE_CARRERA UNIQUE(nombre,carrera);

--ACCIONES-- 
ALTER TABLE Puntos DROP CONSTRAINT FK_PUNTOS_CARRERA;
ALTER TABLE Puntos ADD CONSTRAINT FK_PUNTOS_CARRERA FOREIGN KEY(carrera)REFERENCES Carreras(codigo) ON DELETE CASCADE;
--ACCIONES OK--
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1G4','pun', 56, 'H', 20, 2, 'C10');
DELETE FROM PUNTOS WHERE id_punto = 'C1G4';

-- TRIGGERS --
/* El orden se debe generar automaticamente */
CREATE OR REPLACE TRIGGER TG_IN_PUNTOS_ORDEN
    BEFORE INSERT ON puntos
    FOR EACH ROW
    DECLARE 
    numx NUMBER;
    BEGIN
        SELECT COALESCE(MAX(orden),0) into numx 
        FROM puntos;
        :new.orden := numx+1;
    END;
    /
--DISPARADOR OK--
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1SA','pdn', 56, 'H', 20, 2, 'C10');
DROP TRIGGER TG_IN_PUNTOS_ORDEN;

/*Solo debe existir un punto de partida y un punto de llegada. Si no se dice el tipo del punto se asume que es meta volante a no ser que sea el primer punto que es el de partida.*/
CREATE OR REPLACE TRIGGER TG_IN_PUNTOS_PARTIDA_LLEGADA
    BEFORE INSERT ON puntos
    FOR EACH ROW
    DECLARE
        puntosP NUMBER;
        puntosL NUMBER;
        xpuntos NUMBER;
    BEGIN
        SELECT count(nombre) into puntosP 
        FROM puntos p
        WHERE p.tipo = 'P';
        
        SELECT count(nombre) into puntosL
        FROM puntos p
        WHERE p.tipo = 'L';
        
        SELECT count(nombre) into xpuntos
        FROM puntos p;
        
        IF :new.tipo = 'P' and puntosP >= 1 THEN
            RAISE_APPLICATION_ERROR(-20055,'Ya hay un punto de Partida');
        END IF; 
        IF :new.tipo = 'L' and puntosL >= 1 THEN
            RAISE_APPLICATION_ERROR(-20055,'Ya hay un punto de Llegada');
        END IF; 
        IF :new.tipo is null THEN
            IF xpuntos = 0 THEN
                :new.tipo := 'P';
            ELSE
                :new.tipo := 'V'; 
            END IF;
        END IF; 
    END;
    /
--DISPARADOR OK--
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1DA','dn', 56, 'P', 20, 2, 'C10');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('CA3A','pdFn', 56, 'L', 20, 2, 'C10');
--DISPARADOR NO OK--
/*insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C4FA','fff', 56, 'P', 20, 2, 'C10');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C1FA','p', 56, 'L', 20, 2, 'C10');*/
DROP TRIGGER TG_IN_PUNTOS_PARTIDA_LLEGADA;

/* Los unicos datos que se pueden modificar son el tipo y la duracion , No se puede modificar el punto de partida y solo puede existir un punto de llegada */
CREATE OR REPLACE TRIGGER TG_UP_PUNTOS
    BEFORE UPDATE ON puntos
    FOR EACH ROW
    DECLARE
        puntosL NUMBER;
    BEGIN
        IF :old.tipo = 'P' THEN
            RAISE_APPLICATION_ERROR(-20051,'No se puede modificar el punto de Partida');
        END IF;
        IF :old.orden != :new.orden OR :old.nombre != :new.nombre OR :old.distancia != :new.distancia THEN
            RAISE_APPLICATION_ERROR(-20055,'Los unicos datos que se pueden modificar son el tipo y la duracion');
        END IF;
    END;
    /
--DISPARADOR OK--
UPDATE puntos SET tipo= 'H' WHERE id_punto= 'CA3A';
--DISPARADOR NO OK--
/*UPDATE puntos SET nombre= 'A' WHERE id_punto= 'CA3A';
UPDATE puntos SET distancia= 6 WHERE id_punto= 'CA3A';*/
DROP TRIGGER TG_UP_PUNTOS;

/* Los puntos no se pueden eliminar */
CREATE OR REPLACE TRIGGER TG_EL_PUNTOS
    BEFORE DELETE ON puntos
    FOR EACH ROW
    DECLARE
        puntosL NUMBER;
    BEGIN
        RAISE_APPLICATION_ERROR(-20055,'Los puntos no se pueden eliminar');
    END;
    /
--DISPARADOR NO OK--
/*DELETE FROM PropiedadDe;
DELETE FROM EsOrganizador;
DELETE FROM Fotos;
DELETE FROM Registros;
DELETE FROM Participa;
DELETE FROM Segmentos;
DELETE FROM Versiones;
DELETE FROM puntos;*/
DROP TRIGGER TG_EL_PUNTOS;

/*Si no se conoce la duracion maxima se asume una velocidad de 60 km / hora */
CREATE OR REPLACE TRIGGER TG_IN_PUNTOS_DURACION
BEFORE INSERT ON puntos
FOR EACH ROW
BEGIN
    IF :new.tiempoLimite is null THEN
        :new.tiempoLimite := :new.distancia /60;
    END IF;
END;
/
--DISPARADOR OK --
ALTER TABLE puntos DROP CONSTRAINT CK_PUNTOS_TIEMPOLIMITE;
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('CA3B','pffn', 56, 'L', 70, null, 'C10');
DROP TRIGGER TG_IN_PUNTOS_DURACION;

 /* El codigo de la carrera se genera automaticamente  con las 2 primeras letras del nombre y un numero de carreras que haya hasta el 
    momento + uno*/ 
 CREATE OR REPLACE TRIGGER TG_IN_CARRERA_TCODIGO
    BEFORE INSERT ON Carreras
    FOR EACH ROW
    DECLARE
        xnum NUMBER;
    BEGIN
        SELECT count(nombre) into xnum
        FROM carreras c;
        :new.codigo :=  CONCAT(UPPER(SUBSTR(:new.nombre,0,2)),TO_CHAR(xnum));
    END;
    /
-- DISPARADOR OK -- 
INSERT INTO Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C3', 'Giro de Italia', 'BELARUA', 2, 'A');
DROP TRIGGER TG_IN_CARRERA_TCODIGO;

/* Solo se puede modificar la categoría de una carrera */
CREATE OR REPLACE TRIGGER TG_MO_CARRERA
    BEFORE UPDATE ON Carreras
    FOR EACH ROW
    BEGIN
        IF :old.codigo != :new.codigo OR :old.nombre != :new.nombre OR :old.pais != :new.pais OR :old.periodicidad != :new.periodicidad THEN
            RAISE_APPLICATION_ERROR(-20055,'Solo se puede modificar la categoria en la carrera');
        END IF;
    END;
    /
--DISPARADOR OK--
UPDATE carreras SET categoria= 3 WHERE codigo= 'C10';
--DISPARADOR NO OK--
/*UPDATE carreras SET nombre='nicol' WHERE codigo= 'C10';
UPDATE carreras SET pais='camil' WHERE codigo= 'C10';*/
DROP TRIGGER  TG_MO_CARRERA;

/* Las carreras solo se pueden eliminar si no pertenecen a ningun miembro */ 
CREATE OR REPLACE TRIGGER TG_EL_CARRERA
    BEFORE DELETE ON Carreras
    FOR EACH ROW
    DECLARE 
    xnum NUMBER;
    BEGIN
        SELECT count(carrera) into xnum
        FROM propiedadde p
        WHERE :old.codigo = p.carrera;
        IF xnum > 0 THEN
            RAISE_APPLICATION_ERROR(-20055,'la carrera ya pertenece a una o mas personas');
        END IF;
    END;
    /
--DISPARADOR OK--
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C10P', 'Vuelta a EspaÃ±a', 'INDONESIA', 2, 'A');
DELETE FROM Carreras WHERE codigo = 'C10P';
--DISPARADOR NO OK
/*insert into Miembros (id, idt, idn, pais, correo ) values (40, 'NT', 95345345922, 'CHINA', 'lkeneford0@sfgate.com');
insert into PropiedadDe (miembro, carrera, porcentaje) values (40, 'C9P', 94.85);
insert into Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C9P', 'Vuelta a EspaÃ±a', 'INDONESIA', 2, 'A');
DELETE FROM Carreras WHERE codigo = 'C9P';*/
DROP TRIGGER TG_EL_CARRERA;

                                                        -- Registrar Version --
--ACCIONES--
ALTER TABLE Versiones DROP CONSTRAINT FK_VERSIONES_CARRERA;
ALTER TABLE Versiones ADD CONSTRAINT FK_VERSIONES_CARRERA FOREIGN KEY(carrera)REFERENCES Carreras(codigo) ON DELETE CASCADE;
ALTER TABLE Segmentos DROP CONSTRAINT FK_SEGMENTOS_VERSION;
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_VERSION FOREIGN KEY(version)REFERENCES Versiones(id_version) ON DELETE CASCADE;
ALTER TABLE Segmentos DROP CONSTRAINT FK_SEGMENTOS_PUNTOINICIAL;
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_PUNTOINICIAL FOREIGN KEY(puntoInicial)REFERENCES Puntos(id_punto) ON DELETE CASCADE;
ALTER TABLE Segmentos DROP CONSTRAINT FK_SEGMENTOS_PUNTOFINAL;
ALTER TABLE Segmentos ADD CONSTRAINT FK_SEGMENTOS_PUNTOFINAL FOREIGN KEY(puntoFinal)REFERENCES Puntos(id_punto) ON DELETE CASCADE;
--ACCIONES OK--
INSERT INTO Carreras (codigo, nombre, pais, categoria, periodicidad) values ('C3', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C3P6','puntoK', 61, 'P', 436763.48, 253686261, 'C3');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('C7P9','puntoL', 43, 'L', 42993.54, 349240490, 'C3');
insert into Versiones (id_version, nombre, fecha, carrera) values (50, 'C34',  TO_DATE('1999/10/01' ,'YYYY/MM/DD'), 'C3');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S1', 'C', 'C3P6', 'C7P9', 50);
DELETE FROM segmentos WHERE nombre = 'V5S1';
DELETE FROM versiones WHERE id_version = 50;

--TUPLAS--
/* Los puntos de los segmentos deben ser diferentes */
ALTER TABLE segmentos ADD CONSTRAINT CK_SEGMENTOS_PUNTOSDIFERENTES CHECK( puntoInicial != puntoFinal);
--TUPLAS OK--
insert into Versiones (id_version, nombre, fecha, carrera) values (50, 'C34',  TO_DATE('1999/10/01' ,'YYYY/MM/DD'), 'C3');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S2', 'C', 'C3P6', 'C7P9', 50);
--TUPLAS NO OK--
/*insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('VFS2', 'C', 'C3P6', 'C3P6', 50);*/

--UK--
ALTER TABLE versiones ADD CONSTRAINT UK_VERSIONES_NOMBRE UNIQUE(nombre);

--TRIGGERS--
/* El id de la version se genera automaticamente */ 
CREATE OR REPLACE TRIGGER TG_IN_VERSION
    BEFORE INSERT ON versiones
    FOR EACH ROW
    DECLARE 
    xnum NUMBER;
    BEGIN
        SELECT COALESCE(MAX(id_version),0) into xnum
        FROM versiones;
        :new.id_version := xnum+1;
    END;
    /
--DISPARADOR OK--
insert into Versiones (id_version, nombre, fecha, carrera) values (50, 'C343',  TO_DATE('1999/10/01' ,'YYYY/MM/DD'), 'C3');
DROP TRIGGER TG_IN_VERSION;

/* Solo se puede actualizar la fecha de una version siempre y cuando la fecha de dicha version no haya pasado */ 
CREATE OR REPLACE TRIGGER TG_MO_VERSION_FECHA
    BEFORE UPDATE ON  versiones
    FOR EACH ROW
    DECLARE 
    actual DATE;
    BEGIN
        SELECT sysdate into actual
        FROM dual;
        IF :new.fecha > actual THEN
            RAISE_APPLICATION_ERROR(-20055,'La fecha de la version ya paso');
        END IF;
    END;
    /
--DISPARADOR OK--
UPDATE versiones SET fecha = TO_DATE('2009/10/01' ,'YYYY/MM/DD')  WHERE id_version = 51;
--DISPARADOR NO OK--
/*UPDATE versiones SET fecha = TO_DATE('2079/10/01' ,'YYYY/MM/DD')  WHERE id_version = 51;*/
DROP TRIGGER TG_MO_VERSION_FECHA;

/* No se pueden eliminar versiones */ 
CREATE OR REPLACE TRIGGER TG_EL_VERSION
    BEFORE DELETE ON  versiones
    FOR EACH ROW
    BEGIN
        RAISE_APPLICATION_ERROR(-20055,'No se pueden eliminar las versiones');
    END;
    /
--DISPARADOR NO OK--
/*DELETE FROM Versiones WHERE id_version = 51;*/

/* Los segmentos solo pueden tener puntos que pertenezcan a la misma carrera*/ 
CREATE OR REPLACE TRIGGER TG_IN_SEGMENTO
    BEFORE INSERT ON segmentos
    FOR EACH ROW
    DECLARE
    c1 VARCHAR2(15);
    c2 VARCHAR2(15);
    BEGIN
        SELECT DISTINCT p.carrera into c1
        FROM puntos p , segmentos s
        WHERE :new.puntoInicial = p.id_punto;
        
        SELECT DISTINCT p.carrera into c2
        FROM puntos p , segmentos s
        WHERE :new.puntoFinal = p.id_punto;
        
        IF c1 != c2 THEN
            RAISE_APPLICATION_ERROR(-20055,'Los puntos son de diferentes carreras');
        END IF;
    END;
    /
--DISPARADOR OK--
INSERT INTO Carreras (codigo, nombre, pais, categoria, periodicidad) values ('K1', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('P7','puntoK', 61, 'P', 436763.48, 253686261, 'K1');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('P8','puntoL', 43, 'L', 42993.54, 349240490, 'K1');
insert into Versiones (id_version, nombre, fecha, carrera) values (11, 'CT',  TO_DATE('1999/10/01' ,'YYYY/MM/DD'), 'K1');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5S1', 'C', 'P7', 'P8', 11);
--DISPARADOR NO OK--
/*INSERT INTO Carreras (codigo, nombre, pais, categoria, periodicidad) values ('K2', 'Giro de Italia', 'BELARUA', 2, 'A');
insert into Puntos (id_punto, nombre,orden, tipo, distancia, tiempoLimite, carrera) values ('P9','puntoL', 43, 'L', 42993.54, 349240490, 'K2');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('V5F1', 'C', 'P7', 'P9', 11);*/
DROP TRIGGER TG_IN_SEGMENTO;

/* Solo se puede eliminar un segemento si ya paso mas de un mes de la fecha de la version */
CREATE OR REPLACE TRIGGER TG_EL_SEGMENTO
    BEFORE DELETE ON segmentos
    FOR EACH ROW
    DECLARE 
    actual DATE;
    fecha DATE;
    BEGIN
        SELECT sysdate into actual
        FROM dual;
        
        SELECT v.fecha into fecha
        FROM versiones v
        WHERE :old.version = v.id_version ;
        
        IF fecha > actual+31 THEN
            RAISE_APPLICATION_ERROR(-20055,'Ya paso mas de un mes de la fecha de la version');
        END IF;
    END;
    /
--DISPARADOR OK--
insert into Versiones (id_version, nombre, fecha, carrera) values (12, 'CTH',  TO_DATE('2019/10/01' ,'YYYY/MM/DD'), 'K1');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('VXS1', 'C', 'P7', 'P8', 12);
DELETE FROM segmentos WHERE nombre = 'VXS1';
--DISPARADOR NO OK--
/*insert into Versiones (id_version, nombre, fecha, carrera) values (13, 'CGH',  TO_DATE('2020/10/01' ,'YYYY/MM/DD'), 'K1');
insert into Segmentos (nombre, tipo, puntoInicial, puntoFinal, version) values ('VZZ1', 'C', 'P7', 'P8', 13);
DELETE FROM segmentos WHERE nombre = 'VZZ1';*/

