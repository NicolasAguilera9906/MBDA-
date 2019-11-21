-- POBLAR TABLA PLACE--

/*SELECT CONCAT('INSERT INTO place VALUES(',place_no,',',place_town,',',place_country,');') FROM place*/
INSERT INTO place VALUES(1,'Manchester','England');
INSERT INTO place VALUES(2,'Edinburgh','Scotland');
INSERT INTO place VALUES(3,'Salzburg','Austria');
INSERT INTO place VALUES(4,'New York','USA');
INSERT INTO place VALUES(5,'Birmingham','England');
INSERT INTO place VALUES(6,'Glasgow','Scotland');
INSERT INTO place VALUES(7,'London','England');
INSERT INTO place VALUES(8,'Chicago','USA');
INSERT INTO place VALUES(9,'Amsterdam','Netherlands');


-- POBLAR TABLA DE MUSICIAN--

/*SELECT CONCAT('INSERT INTO musician VALUES(',m_no,',',m_name,',','TO_DATE(',REPLACE(born,'-','/'),', yyyy/mm/dd)',',',CASE WHEN died IS NULL THEN 'null'  ELSE CONCAT('TO_DATE(',REPLACE(died,'-','/'),', yyyy/mm/dd)') END, ',',born_in,',',living_in,');') FROM musician*/
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
INSERT INTO musician VALUES ( 9 , 'Phil Hot' ,TO_DATE('30/06/1942','DD/MM/YYYY'),null, 1 , 8,
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
INSERT INTO musician VALUES(10,'Jeff Dawn',TO_DATE('1945/12/12','YYYY/MM/DD'),null,3,6,
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
INSERT INTO musician VALUES(11,'Rose Spring',TO_DATE('1948/05/25','YYYY/MM/DD'),null,4,5,
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
INSERT INTO musician VALUES(12,'Davis Heavan',TO_DATE('1975/10/03','YYYY/MM/DD'),null,5,4,
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
INSERT INTO musician VALUES(13,'Lovely Time',TO_DATE('1948/12/28','YYYY/MM/DD'),null,6,3,
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
INSERT INTO musician VALUES(14,'Alan Fluff',TO_DATE('1935/01/15','YYYY/MM/DD'),TO_DATE('1997/05/15','YYYY/MM/DD'),7,2,
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
INSERT INTO musician VALUES(15,'Tony Smythe',TO_DATE('1932/04/02','YYYY/MM/DD'),null,8,1,
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
INSERT INTO musician VALUES(16,'James Quick',TO_DATE('1924/08/08','YYYY/MM/DD'),null,9,2,
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
INSERT INTO musician VALUES(17,'Freda Miles',TO_DATE('1920/07/04','YYYY/MM/DD'),null,9,3,
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
INSERT INTO musician VALUES(18,'Elsie James',TO_DATE('1947/05/06','YYYY/MM/DD'),null,8,5,
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
INSERT INTO musician VALUES(19,'Andy Jones',TO_DATE('1958/10/08','YYYY/MM/DD'),null,7,6,
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
INSERT INTO musician VALUES(20,'Louise Simpson',TO_DATE('1948/01/10','YYYY/MM/DD'),TO_DATE('1998/02/11','YYYY/MM/DD'),6,6,
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
INSERT INTO musician VALUES(21,'James Steeple',TO_DATE('1947/01/10','YYYY/MM/DD'),null,5,6,
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
INSERT INTO musician VALUES(22,'Steven Chaytors',TO_DATE('1956/03/11','YYYY/MM/DD'),null,6,7,
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

-- POBLAR TABLA DE COMPOSER--

/*SELECT CONCAT('INSERT INTO composer VALUES(',comp_no,',',comp_is,',',comp_type,');') FROM composer*/
INSERT INTO composer VALUES(1,1,'jazz');
INSERT INTO composer VALUES(2,3,'classical');
INSERT INTO composer VALUES(3,5,'jazz');
INSERT INTO composer VALUES(4,7,'classical');
INSERT INTO composer VALUES(5,9,'jazz');
INSERT INTO composer VALUES(6,11,'rock');
INSERT INTO composer VALUES(7,13,'classical');
INSERT INTO composer VALUES(8,15,'jazz');
INSERT INTO composer VALUES(9,17,'classical');
INSERT INTO composer VALUES(10,19,'jazz');
INSERT INTO composer VALUES(11,10,'rock');
INSERT INTO composer VALUES(12,8,'jazz');



-- POBLAR TABLA DE PERFORMER--

/*SELECT CONCAT('INSERT INTO performer VALUES(',perf_no,',',perf_is,',',instrument,',',perf_type,');') FROM performer*/
INSERT INTO performer VALUES(1,2,'violin','classical');
INSERT INTO performer VALUES(2,4,'viola','classical');
INSERT INTO performer VALUES(3,6,'banjo','jazz');
INSERT INTO performer VALUES(4,8,'violin','classical');
INSERT INTO performer VALUES(5,12,'guitar','jazz');
INSERT INTO performer VALUES(6,14,'violin','classical');
INSERT INTO performer VALUES(7,16,'trumpet','jazz');
INSERT INTO performer VALUES(8,18,'viola','classical');
INSERT INTO performer VALUES(9,20,'bass','jazz');
INSERT INTO performer VALUES(10,2,'flute','jazz');
INSERT INTO performer VALUES(11,20,'cornet','jazz');
INSERT INTO performer VALUES(12,6,'violin','jazz');
INSERT INTO performer VALUES(13,8,'drums','jazz');
INSERT INTO performer VALUES(14,10,'violin','classical');
INSERT INTO performer VALUES(15,12,'cello','classical');
INSERT INTO performer VALUES(16,14,'viola','classical');
INSERT INTO performer VALUES(17,16,'flute','jazz');
INSERT INTO performer VALUES(18,18,'guitar','not known');
INSERT INTO performer VALUES(19,20,'trombone','jazz');
INSERT INTO performer VALUES(20,3,'horn','jazz');
INSERT INTO performer VALUES(21,5,'violin','jazz');
INSERT INTO performer VALUES(22,7,'cello','classical');
INSERT INTO performer VALUES(23,2,'bass','jazz');
INSERT INTO performer VALUES(24,4,'violin','jazz');
INSERT INTO performer VALUES(25,6,'drums','classical');
INSERT INTO performer VALUES(26,8,'clarinet','jazz');
INSERT INTO performer VALUES(27,10,'bass','jazz');
INSERT INTO performer VALUES(28,12,'viola','classical');
INSERT INTO performer VALUES(29,18,'cello','classical');




-- POBLAR TABLA BAND--

/*SELECT CONCAT('INSERT INTO band VALUES(',band_no,',',band_name,',',band_home,',',band_type,',',CASE WHEN b_date IS NULL THEN 'null' ELSE CONCAT('TO_DATE(',REPLACE(b_date,'-','/'),', yyyy/mm/dd)') END, ',',band_contact,');') FROM band*/
INSERT INTO band VALUES(1,'ROP',5,'classical',TO_DATE('1930/01/01','YYYY/MM/DD'),11);
INSERT INTO band VALUES(2,'AASO',6,'classical',null,10);
INSERT INTO band VALUES(3,'The J Bs',8,'jazz',null,12);
INSERT INTO band VALUES(4,'BBSO',9,'classical',null,21);
INSERT INTO band VALUES(5,'The left Overs',2,'jazz',null,8);
INSERT INTO band VALUES(6,'Somebody Loves this',1,'jazz',null,6);
INSERT INTO band VALUES(7,'Oh well',4,'classical',null,3);
INSERT INTO band VALUES(8,'Swinging strings',4,'classical',null,7);
INSERT INTO band VALUES(9,'The Rest',9,'jazz',null,16);



-- POBLAR TABLA DE COMPOSITION--

/*SELECT CONCAT('INSERT INTO composition VALUES(',c_no,',',CASE WHEN comp_date IS NULL THEN 'null' ELSE CONCAT('TO_DATE(',REPLACE(comp_date,'-','/'),', 'yyyy/mm/dd)'') END, ',',c_title,',',c_in,');') FROM composition */
INSERT INTO composition VALUES(21,TO_DATE('1990/07/12','yyyy/mm/dd'),'A Last Song',6);
INSERT INTO composition VALUES(1,TO_DATE('1975/06/17','YYYY/MM/DD'),'Opus 1',1);
INSERT INTO composition VALUES(2,TO_DATE('1976/07/21','YYYY/MM/DD'),'Here Goes',2);
INSERT INTO composition VALUES(3,TO_DATE('1981/12/14','YYYY/MM/DD'),'Valiant Knight',3);
INSERT INTO composition VALUES(4,TO_DATE('1982/01/12','YYYY/MM/DD'),'Little Piece',4);
INSERT INTO composition VALUES(5,TO_DATE('1985/03/13','YYYY/MM/DD'),'Simple Song',5);
INSERT INTO composition VALUES(6,TO_DATE('1986/04/14','YYYY/MM/DD'),'Little Swing Song',6);
INSERT INTO composition VALUES(7,TO_DATE('1987/05/13','YYYY/MM/DD'),'Fast Journey',7);
INSERT INTO composition VALUES(8,TO_DATE('1976/02/14','YYYY/MM/DD'),'Simple Love Song',8);
INSERT INTO composition VALUES(9,TO_DATE('1982/01/21','YYYY/MM/DD'),'Complex Rythms',9);
INSERT INTO composition VALUES(10,TO_DATE('1985/02/23','YYYY/MM/DD'),'Drumming Rythms',9);
INSERT INTO composition VALUES(11,TO_DATE('1978/03/18','YYYY/MM/DD'),'Fast Drumming',8);
INSERT INTO composition VALUES(12,TO_DATE('1984/08/13','YYYY/MM/DD'),'Slow Song',7);
INSERT INTO composition VALUES(13,TO_DATE('1968/09/14','YYYY/MM/DD'),'Blue Roses',6);
INSERT INTO composition VALUES(14,TO_DATE('1983/11/15','YYYY/MM/DD'),'Velvet Rain',5);
INSERT INTO composition VALUES(15,TO_DATE('1982/05/16','YYYY/MM/DD'),'Cold Wind',4);
INSERT INTO composition VALUES(16,TO_DATE('1983/06/18','YYYY/MM/DD'),'After the Wind Blows',3);
INSERT INTO composition VALUES(17,null,'A Simple Piece',2);
INSERT INTO composition VALUES(18,TO_DATE('1985/01/12','YYYY/MM/DD'),'Long Rythms',1);
INSERT INTO composition VALUES(19,TO_DATE('1988/02/12','YYYY/MM/DD'),'Eastern Wind',1);
INSERT INTO composition VALUES(20,null,'Slow Symphony Blowing',2);

-- POBLAR TABLA HAS_COMPOSED--

/*SELECT CONCAT('INSERT INTO has_composed VALUES(',cmpr_no,',',cmpn_no,');') FROM has_composed*/
INSERT INTO has_composed VALUES(1,1);
INSERT INTO has_composed VALUES(1,8);
INSERT INTO has_composed VALUES(2,11);
INSERT INTO has_composed VALUES(3,2);
INSERT INTO has_composed VALUES(3,13);
INSERT INTO has_composed VALUES(3,14);
INSERT INTO has_composed VALUES(3,18);
INSERT INTO has_composed VALUES(4,12);
INSERT INTO has_composed VALUES(4,20);
INSERT INTO has_composed VALUES(5,3);
INSERT INTO has_composed VALUES(5,13);
INSERT INTO has_composed VALUES(5,14);
INSERT INTO has_composed VALUES(6,15);
INSERT INTO has_composed VALUES(6,21);
INSERT INTO has_composed VALUES(7,4);
INSERT INTO has_composed VALUES(7,9);
INSERT INTO has_composed VALUES(8,16);
INSERT INTO has_composed VALUES(9,5);
INSERT INTO has_composed VALUES(9,10);
INSERT INTO has_composed VALUES(10,17);
INSERT INTO has_composed VALUES(11,6);
INSERT INTO has_composed VALUES(12,7);
INSERT INTO has_composed VALUES(12,19);

-- POBLAR TABLA PLAYS_IN--

/*SELECT CONCAT('INSERT INTO plays_in VALUES(',player,',',band_id,');') FROM plays_in*/
INSERT INTO plays_in VALUES(1,1);
INSERT INTO plays_in VALUES(1,7);
INSERT INTO plays_in VALUES(3,1);
INSERT INTO plays_in VALUES(4,1);
INSERT INTO plays_in VALUES(4,7);
INSERT INTO plays_in VALUES(5,1);
INSERT INTO plays_in VALUES(6,1);
INSERT INTO plays_in VALUES(6,7);
INSERT INTO plays_in VALUES(7,1);
INSERT INTO plays_in VALUES(8,1);
INSERT INTO plays_in VALUES(8,7);
INSERT INTO plays_in VALUES(10,2);
INSERT INTO plays_in VALUES(12,2);
INSERT INTO plays_in VALUES(13,2);
INSERT INTO plays_in VALUES(14,2);
INSERT INTO plays_in VALUES(14,8);
INSERT INTO plays_in VALUES(15,2);
INSERT INTO plays_in VALUES(15,8);
INSERT INTO plays_in VALUES(17,2);
INSERT INTO plays_in VALUES(18,2);
INSERT INTO plays_in VALUES(19,3);
INSERT INTO plays_in VALUES(20,3);
INSERT INTO plays_in VALUES(21,4);
INSERT INTO plays_in VALUES(22,4);
INSERT INTO plays_in VALUES(23,4);
INSERT INTO plays_in VALUES(25,5);
INSERT INTO plays_in VALUES(26,6);
INSERT INTO plays_in VALUES(27,6);
INSERT INTO plays_in VALUES(28,7);
INSERT INTO plays_in VALUES(28,8);
INSERT INTO plays_in VALUES(29,7);


-- POBLAR TABLA DE CONCERT--

/*SELECT CONCAT('INSERT INTO concert VALUES(',concert_no,',',concert_venue,',',concert_in,',','TO_DATE(',REPLACE(con_date,'-','/'),', yyyy/mm/dd)',',',concert_orgniser,');') FROM concert*/
INSERT INTO concert VALUES(1,'Bridgewater Hall',1,TO_DATE('1995/01/06','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(2,'Bridgewater Hall',1,TO_DATE('1996/05/08','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(3,'Usher Hall',2,TO_DATE('1995/06/03','YYYY/MM/DD'),3);
INSERT INTO concert VALUES(4,'Assembly Rooms',2,TO_DATE('1997/09/20','YYYY/MM/DD'),21);
INSERT INTO concert VALUES(5,'Festspiel Haus',3,TO_DATE('1995/02/21','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(6,'Royal Albert Hall',7,TO_DATE('1993/04/12','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(7,'Concertgebouw',9,TO_DATE('1993/05/14','YYYY/MM/DD'),8);
INSERT INTO concert VALUES(8,'Metropolitan',4,TO_DATE('1997/06/15','YYYY/MM/DD'),21);


-- POBLAR TABLA PERFORMANCE--

/*SELECT CONCAT('INSERT INTO performance VALUES(',pfrmnc_no,',',gave,',',performed,',',conducted_by,',',performed_in,');') FROM performance*/
INSERT INTO performance VALUES(1,1,1,21,1);
INSERT INTO performance VALUES(2,1,3,21,1);
INSERT INTO performance VALUES(3,1,5,21,1);
INSERT INTO performance VALUES(4,1,2,1,2);
INSERT INTO performance VALUES(5,2,4,21,2);
INSERT INTO performance VALUES(6,2,6,21,2);
INSERT INTO performance VALUES(7,4,19,9,3);
INSERT INTO performance VALUES(8,4,20,10,3);
INSERT INTO performance VALUES(9,5,12,10,4);
INSERT INTO performance VALUES(10,5,13,11,4);
INSERT INTO performance VALUES(11,3,5,13,5);
INSERT INTO performance VALUES(12,3,6,13,5);
INSERT INTO performance VALUES(13,3,7,13,5);
INSERT INTO performance VALUES(14,6,20,14,6);
INSERT INTO performance VALUES(15,8,12,15,7);
INSERT INTO performance VALUES(16,9,16,21,8);
INSERT INTO performance VALUES(17,9,17,21,8);
INSERT INTO performance VALUES(18,9,18,21,8);
INSERT INTO performance VALUES(19,9,19,21,8);
INSERT INTO performance VALUES(20,4,12,10,3);