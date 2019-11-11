--La fecha de Llegada debe ser mayor a la fecha de Envio. 
ALTER TABLE despachos ADD CONSTRAINT TUP_DESPACHOS_FECHAS
CHECK (
    fechaEnvio<=fechaLlegada
);
--La fecha limite debe ser mayor a la fecha pagada
ALTER TABLE pagos ADD CONSTRAINT TUP_PAGOS_FECHAS
CHECK (
    fechaPagada<=fechaLimite
);
