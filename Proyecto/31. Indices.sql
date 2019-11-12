
/* INDICES */ 

CREATE INDEX index_fecha_envio 
ON Despachos(FechaEnvio);

CREATE INDEX index_fecha_pagada 
ON Pagos(fechaPagada);

CREATE INDEX index_nombre_clientes 
ON Clientes(nombres);
