--CHECKS--

ALTER TABLE Clientes 
ADD CONSTRAINT CK_CLIENTES_DOCUMENTO 
CHECK(
    documento>999999999
);

ALTER TABLE Clientes 
ADD CONSTRAINT CK_CLIENTES_CORREO 
CHECK(
    REGEXP_LIKE (correo,'^[^@]+@[^@]+\.[a-zA-Z]{2,}$')
);

ALTER TABLE Ubicaciones 
ADD CONSTRAINT CK_UBICACIONES_DIRECCION 
CHECK(
    REGEXP_LIKE(direccion,'^[a-zA-Z0-9 #-]*$')
);

ALTER TABLE Fotos
ADD CONSTRAINT CK_FOTOS_URL
CHECK(
    url LIKE 'www.%.png'
);

ALTER TABLE EventosDeportivos
ADD CONSTRAINT CK_EVENTOS_PERIODICIDAD
CHECK(
    periodicidad = 'A' 
    OR periodicidad = 'S'
);

ALTER TABLE Registros 
ADD CONSTRAINT CK_REGISTROS_PRECIO
CHECK(
    precio>0 and precio <= 9999999999
);

ALTER TABLE Registros
ADD CONSTRAINT CK_REGISTROS_HORA
CHECK(
    horaRegistro >=0
    AND horaRegistro <= 2400
    AND MOD(horaRegistro,100) >=0
    AND MOD(horaRegistro,100) <= 59
);
    
    








