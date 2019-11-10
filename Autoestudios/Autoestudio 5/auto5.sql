/*A. Definiendo y poblando */

CREATE TABLE musician(
M_NO NUMBER(11) NOT NULL,
M_NAME VARCHAR2(20),
BORN DATE,
DIED DATE,
BORN_IN NUMBER(11),
LIVING_IN NUMBER(11),
DETALLES XMLTYPE NOT NULL
);

ALTER TABLE musician
ADD CONSTRAINT PK_MUSICIAN
PRIMARY KEY (M_NO);


INSERT INTO musician VALUES ( 1 , 'Fred Bloggs' ,TO_DATE('02/01/1948','DD/MM/YYYY'),NULL, 1 , 2,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "fred.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "Carlos"
            razon = "SAL">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "SONY">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "besos"
            año = "1999">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "grammy"
            año = "2001">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "ECI"
            año_inicio = "2005"
            año_fin = "2006"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 2 , 'John Smith' ,TO_DATE('03/03/1950','DD/MM/YYYY'),NULL, 1 , 2,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "John.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "Ernesto"
            razon = "feliz">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "UNIVERSAL">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "besos"
            año = "1999">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "platino"
            año = "2001">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "ECI"
            año_inicio = "1910"
            año_fin = "1995"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 3 , 'Helen Smyth' ,TO_DATE('08/08/1948','DD/MM/YYYY'),NULL, 4 , 5,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "Helenmusic.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "Ernesto"
	    razon = "musico">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "musicSony">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "amor"
            año = "1999">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "anglo"
            año = "2001">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UNacional"
            año_inicio = "2000"
            año_fin = "2001"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 4 , 'Harriet Smithson' ,TO_DATE('08/08/1909','DD/MM/YYYY'),TO_DATE('20/09/1980','DD/MM/YYYY'), 5 , 6,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "Harrietmusic.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "Harry"
	    razon = "musico">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "Deezer">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "existo"
            año = "1999">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "tuVoz"
            año = "2001">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UMusical"
            año_inicio = "2000"
            año_fin = "2006"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 5 , 'James First' ,TO_DATE('10/06/1965','DD/MM/YYYY'),null, 7 , 7,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "Jamesmusic.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "juanes"
	    razon = "cantante">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "Spotify">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "castigo"
            año = "2002">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "bestsong"
            año = "2005">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UMusical"
            año_inicio = "1980"
            año_fin = "1985"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 6 , 'Theo Mengel' ,TO_DATE('12/08/1948','DD/MM/YYYY'),null, 7 , 1,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "Theoclassic.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "teofilo"
	    razon = "actor">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "Deezer">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "curramba"
            año = "2005">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "bestcarranga"
            año = "2010">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UM"
            año_inicio = "2005"
            año_fin = "2008"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 7 , 'Sue Little' ,TO_DATE('21/02/1945','DD/MM/YYYY'),null, 8 , 9,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "SueJazz.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "Sue"
	    razon = "Soccer">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "canciondeamor">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "besosusados"
            año = "2005">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "bestartist"
            año = "2010">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UM"
            año_inicio = "2005"
            año_fin = "2008"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 8 , 'Harry Forte' ,TO_DATE('28/02/1951','DD/MM/YYYY'),null, 1 , 8,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "Boleros.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "Sue"
	    razon = "Artist">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "Deezer">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "canciondeamor"
            año = "2005">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "bestDisc"
            año = "2009">
        </premio>
        <premio
            nombre = "BestSongOfTheYear"
            año = "2001">
        </premio>
        <premio
            nombre = "BestSongOfTheYear"
            año = "2001">
        </premio>
        <premio
            nombre = "BestSongOfTheYear"
            año = "2001">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UMusical"
            año_inicio = "1999"
            año_fin = "2003"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');
INSERT INTO musician VALUES ( 9 , '	Phil Hot' ,TO_DATE('30/06/1942','DD/MM/YYYY'),null, 1 , 8,
'<?xml version="1.0"?>
<detalle>
    <pagina
        url = "Hotmusic.com">
    </pagina>
    <otros_nombres>
        <otro_nombre
            nombre = "philip"
            razon = "Singer">
        </otro_nombre>
    </otros_nombres>
    <sellos>
        <sello
            nombre = "Sony">
        </sello>
    </sellos>
    <discos>
        <disco
            nombre = "HotSong"
            año = "2009">
        </disco>
    </discos>
    <premios>
        <premio
            nombre = "BestSongOfTheYear"
            año = "2012">
        </premio>
         <premio
            nombre = "BestSongOfTheYear"
            año = "2012">
        </premio>
        <premio
            nombre = "BestSongOfTheYear"
            año = "2012">
        </premio>
    </premios>
    <universidades>
        <universidad
            nombre = "UMusical"
            año_inicio = "1999"
            año_fin = "2003"
            titulo_obtenido = "musico">
        </universidad>
    </universidades>
</detalle>');

/* B. Consultando */

--1. Los otros nombres de un músico--
SELECT 
    EXTRACTVALUE (detalles,'//otro_nombre/@nombre') 
FROM musician;

--2. Los músicos de un sello específico--
SELECT
    m.m_name as nombre ,EXTRACTVALUE (detalles , '//sello/@nombre') as sello
FROM musician m;

--3. El músico más premiado en un año específico
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

--4. Los discos de un año dado
SELECT
    xt.*
FROM 
    musician m ,
    XMLTABLE('/detalle/discos/disco'
    PASSING m.detalles
    COLUMNS 
    disco VARCHAR2(20) PATH '@nombre',
    año NUMBER PATH '@año'
    ) xt;

--5. Los músicos que estudiaron en la misma universidad
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

/*PROPUESTAS*/

--1. Los premios y el numero de musicos que los ganaron ordenados descendentemente
SELECT xt.premio,count(m_name) as numero_musicos
FROM musician m ,
     XMLTABLE('/detalle/premios/premio'
     PASSING m.detalles
     COLUMNS
     premio VARCHAR2(20) PATH '@nombre'
     ) xt
GROUP BY xt.premio
ORDER BY numero_musicos DESC;

--2. Los 5 discos mas viejos
SELECT m_name,xt.disco as disco , xt.año as año
FROM musician m ,
     XMLTABLE('/detalle/discos/disco'
     PASSING m.detalles
     COLUMNS
     disco VARCHAR2(20) PATH '@nombre',
     año NUMBER PATH '@año'
     ) xt
WHERE ROWNUM <=5
ORDER BY año;

--3. Nombre de los musicos , fecha de inicio de estudios , fecha de graduacion ordenados por los que menos tiempo se demoraron en graduarse
SELECT m_name,xt.*
FROM musician m ,
     XMLTABLE('/detalle/universidades/universidad'
     PASSING m.detalles
     COLUMNS
     año_inicio NUMBER PATH '@año_inicio',
     año_fin NUMBER PATH '@año_fin'
     ) xt
ORDER BY xt.año_fin-xt.año_inicio;

--4. Cantidad de premios ganados por pais
SELECT living_in as codigo_pais ,count(xt.premio) as num_premios
FROM musician m ,
     XMLTABLE('/detalle/premios/premio'
     PASSING m.detalles
     COLUMNS
     premio VARCHAR2(20) PATH '@nombre'
     ) xt
GROUP BY living_in;

--5 Premios de los musicos que ya fallecieron
SELECT m_name,xt.*
FROM musician m ,
     XMLTABLE('/detalle/premios/premio'
     PASSING m.detalles
     COLUMNS
     premio VARCHAR2(20) PATH '@nombre',
     año VARCHAR2(20) PATH '@año'
     ) xt
WHERE died is not null;

/*C. Definiendo esquema*/

/*<?xml version="1.0"?>

<!DOCTYPE detalle [
	<!ELEMENT detalle (pagina,otrosNombres,sellos,discos,premios,universidades,hijos)>
	
	<!ELEMENT pagina EMPTY>
	<!ELEMENT otrosNombres EMPTY>
	<!ELEMENT sellos (sello*)>
	<!ELEMENT sello EMPTY>
	<!ELEMENT discos (disco,disco+)>
	<!ELEMENT disco EMPTY>
	<!ELEMENT premios (premio*)>
	<!ELEMENT premio EMPTY>
	<!ELEMENT universidades (universidad)>
	<!ELEMENT universidad EMPTY>
	<!ELEMENT hijos (hijo*)>
	<!ELEMENT hijo EMPTY>

	<!ATTLIST pagina 
		url ID #REQUIRED>
		
	<!ATTLIST otrosNombres
		nombre CDATA #REQUIRED
		razon  CDATA #REQUIRED>
		
	<!ATTLIST sello 
		nombre CDATA #REQUIRED>

	<!ATTLIST disco 
		nombre CDATA #REQUIRED
		año CDATA #REQUIRED	>

	<!ATTLIST premio
		nombre CDATA #REQUIRED
		año CDATA #REQUIRED>

	<!ATTLIST universidad
		nombre CDATA #REQUIRED
		año_inicio CDATA #REQUIRED
		año_fin CDATA #IMPLIED
		titulo_obtenido (compositor|interprete) #IMPLIED>

	<!ATTLIST hijo
		nombre CDATA #REQUIRED
		sexo (hombre|mujer) #IMPLIED>
]>*/

--PROPUESTAS

-- 1. El tipo de sexo debe ser hombre o mujer
-- 2. El titulo obtenido debe ser compositor o interprete
-- 3. La fecha de graduacion debe ser mayor a la fecha de inicio (NO SE PUDO REALIZAR) 
-- 4. De la universidad se requiere obligatoriamente el nombre y el año de inicio