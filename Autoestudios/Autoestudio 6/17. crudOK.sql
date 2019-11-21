/* PC_MUSICO */
BEGIN
PC_MUSICO.AD_MUSICO('Fred Bloggs' ,TO_DATE('02/01/1948','DD/MM/YYYY'),NULL, 1 , 2, xmltype('<?xml version="1.0"?>
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
</detalle>'));
END;
/
BEGIN
PC_MUSICO.MOD_MUSICO(3,TO_DATE('02/04/2001','DD/MM/YYYY'),5);
END;
/
BEGIN
PC_MUSICO.EL_MUSICO(2);
END;
/
SELECT PC_MUSICO.CO_MUSICO FROM DUAL;
/
SELECT PC_MUSICO.CO_MUSICOS_CIUDAD('Glasgow') FROM DUAL;
/
SELECT PC_MUSICO.CO_MUSICOS_UNIVERSIDAD FROM DUAL;
/
SELECT PC_MUSICO.CO_MUSICOS_PREMIADOS FROM DUAL;
/
/* PC_COMPOSICION */
BEGIN
    PC_COMPOSICION.AD_COMPOSICION(25,TO_DATE('1990/07/12','yyyy/mm/dd'),'cancion',1);
END;
/
SELECT PC_COMPOSICION.CO_COMPOSICION(5) FROM DUAL;
/
SELECT PC_COMPOSICION.CO_COMPOSICION_BANDAS FROM DUAL;
/