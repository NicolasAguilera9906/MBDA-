                                                                        /* PC_REGISTROS */

INSERT INTO Carreras VALUES ( 'C001' , 'Tour de Francia' , 'FRANCIA' ,  1 , 'A');
INSERT INTO Carreras VALUES ( 'C002' , 'Giro de Italia' , 'ITALIA' ,  1 , 'A');
INSERT INTO Versiones VALUES ( 1 , '20191' , TO_DATE ('06/10/2019' , 'DD/MM/YYYY'), 'C001');
INSERT INTO Versiones VALUES ( 2 , '20192' , TO_DATE ('06/10/2019' , 'DD/MM/YYYY'), 'C002');
INSERT INTO Puntos VALUES ('P-10', 10 , 'PuntoI' ,'M' , 10 , 5 , 'C001');
INSERT INTO Puntos VALUES ('P-11', 11 , 'PuntoF' ,'M' , 10 , 5 , 'C001');
INSERT INTO Segmentos VALUES ('SE001' , 'M' , 'P-10' , 'P-11' , 1);
INSERT INTO Segmentos VALUES ('SE002' , 'M' , 'P-10' , 'P-11' , 2);

BEGIN
    PC_REGISTROS.AD_REGISTRO(5 , 10 , 'Secciones de descenso del segmento' , 'A' , 'Dificil', 1014 , 'SE001' ,  1 , xmltype('<?xml version="1.0"?>
    <Detalles_Registro>
        <Registro>
            <Revision>
                <Secciones>
                    <Sduras
                        kilometroInicial = "1"
                        kilometrofinal = "100"
                        velocidadPromedio = "50"
                        velocidadMinima = "30"
                        velocidadMaxima  = "40"
                        pulsacionesPromedio = "50"
                        potenciaPromedio = "60" > 
                    </Sduras>
                    <Sfaciles
                        kilometroInicial = "1"
                        kilometrofinal = "100"
                        velocidadPromedio = "50"
                        velocidadMinima = "30"
                        velocidadMaxima  = "40"
                        pulsacionesPromedio = "50"
                        potenciaPromedio = "60" > 
                    </Sfaciles>
                    <Sdescenso
                        kilometroInicial = "1"
                        kilometrofinal = "100"
                        velocidadPromedio = "50"
                        velocidadMinima = "30"
                        velocidadMaxima  = "40"
                        pulsacionesPromedio = "50"
                        potenciaPromedio = "60" > 
                    </Sdescenso>
                </Secciones>
            </Revision>
            <Fotos>
                <Foto
                    direccion = "www.google.gif">
                </Foto>
            </Fotos>
        </Registro>
    </Detalles_Registro>'));
END;
/
BEGIN
    PC_REGISTROS.MOD_REGISTRO(1,'Secciones de descenso del segmento','DificilF');
END;
/
SELECT PC_REGISTROS.CO_REGISTRO(1) FROM DUAL;
/
BEGIN
    PC_REGISTROS.AD_FOTO('www.movistar.gif',1);
END;
/
BEGIN
    PC_REGISTROS.MOD_FOTO('www.movistar.gif',1);
END;
/

SELECT PC_REGISTROS.CO_FOTO('www.movistar.gif') FROM DUAL;

BEGIN
    PC_REGISTROS.EL_FOTO('www.movistar.gif');
END;
/


