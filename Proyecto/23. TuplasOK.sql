--La fecha de Llegada debe ser mayor a la fecha de Envio. 
insert into ubicaciones (direccion, ciudad, departamento) values ('M6924#KMS-2', 'Jamaica', 'New York');
insert into bodegas (idBodega, ubicacion) values ('T68', 'M6924#KMS-2');
insert into despachos (idDespacho, fechaEnvio, fechaLlegada, bodega) values (2, TO_DATE('1987/05/01','YYYY/MM/DD'),  TO_DATE('1988/02/01','YYYY/MM/DD'),'T68');
--La fecha limite debe ser mayor a la fecha pagada
insert into pagos (idPago, fechaLimite, fechaPagada) values (1, TO_DATE('1969/08/01','YYYY/MM/DD'),  TO_DATE('1968/08/01','YYYY/MM/DD'));

