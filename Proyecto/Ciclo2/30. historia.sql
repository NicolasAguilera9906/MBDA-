--Existia una persona que deseaba inscribirse a un evento deportivo
EXECUTE PA_JEFELOGISTICA.AD_UBICACION('K100#Aq-2', 'Pereira', 'Norte');
EXECUTE PA_CLIENTE.AD_CLIENTE(1014308670, 'Migue',TO_DATE('1739/06/16','YYYY/MM/DD'), 'K100#Aq-2', 39105693, 'mkem1@moonfruit.com')

--Para eso , buscó el detalle de las versiones de los eventos
EXECUTE PA_JEFELOGISTICA.AD_UBICACION ('g#-45', 'Bogota', 'Cundinamarca');
EXECUTE PA_JEFELOGISTICA.AD_UBICACION ('d#-45', 'Cali', 'Valle del Cauca');
EXECUTE PA_JEFELOGISTICA.AD_SEDE ( 'S550' , 'Estadio Bogota' , 'g#-45');
EXECUTE PA_JEFELOGISTICA.AD_SEDE ( 'S650' , 'Estadio Cali' , 'd#-45');
EXECUTE PA_JEFEPUBLICIDAD.AD_EVENTO('E660',NULL,'A','Carrera de caballos' , 'Muy divertida');
EXECUTE PA_JEFEPUBLICIDAD.AD_EVENTO('E770',NULL,'A','Natacion' , 'Muy competitiva');
EXECUTE pa_jefepublicidad.ad_version(TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S550' ,  'E660');
EXECUTE pa_jefepublicidad.ad_version(TO_DATE('2016/01/03' , 'YYYY/MM/DD') , TO_DATE('2017/05/03' , 'YYYY/MM/DD') , 'S650' ,  'E770');
SELECT pa_cliente.co_info_versiones FROM DUAL;

--Tambien busco las versiones que estuvieran en su ciudad
SELECT pa_cliente.co_version_ciudad('Bogota') FROM DUAL;

--Tambien busco las versiones que estuvieran antes del 2015
SELECT pa_cliente.co_version_fecha(TO_DATE('2015/01/03' , 'YYYY/MM/DD')) FROM DUAL;

--Finalmente  se registró en una de las versiones a las 10 de la noche por un precio de 100000
EXECUTE pa_cliente.ad_registro( 1 , 1014308670 , TO_DATE('2015/01/03' , 'YYYY/MM/DD') , 2200 , 100000);


