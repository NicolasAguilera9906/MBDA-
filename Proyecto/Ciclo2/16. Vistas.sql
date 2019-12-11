--Conocer los Eventos Deportivos con más registros en el ultimo mes
CREATE OR REPLACE view EventosRegistrados_UltimoMes AS
    SELECT 
        e.nombre as evento, 
        s.nombre as sede , 
        u.ciudad , 
        sum(r.precio) as precioTotal
    FROM EventosDeportivos e ,
         versiones v ,
         sedes s , 
         ubicaciones u , 
         registros r
    WHERE v.evento = e.idEvento
    AND v.sede = s.idSede
    AND s.ubicacion = u.direccion
    AND r.version = v.idVersion
    /*AND r.fechaRegistro <= sysdate 
    AND r.fechaRegistro  >= ADD_MONTHS(sysdate,-1)*/
    GROUP BY e.nombre , s.nombre , u.ciudad
    ORDER BY precioTotal DESC;

--Conocer los clientes que más se han registrado en las versiones de los eventos
CREATE OR REPLACE view Clientes_MasRegistrados AS
    SELECT 
        c.documento as cliente , 
        count(r.version) as num_registros
    FROM clientes c ,
         registros r 
    WHERE c.documento = r.cliente
    GROUP BY c.documento
    ORDER BY num_registros DESC;

--Conocer las sedes por numero de versiones activas
CREATE OR REPLACE view Sedes_Activas AS
    SELECT 
        s.nombre as sede  , 
        count(v.idVersion) as num_versiones
    FROM 
        sedes s , 
        versiones v
    WHERE v.sede = s.idSede
    AND v.fechaInicio <= sysdate
    AND sysdate <= v.fechaFin
    GROUP BY s.nombre
    ORDER BY num_versiones;

--Conocer los eventos por numero de versiones realizadas
CREATE OR REPLACE view Eventos_VersionesRealizadas AS
    SELECT 
        e.nombre , 
        count(v.idVersion) as num_versiones
    FROM 
        EventosDeportivos e , 
        versiones v
    WHERE e.idEvento = v.evento
    AND sysdate > v.fechaFin
    GROUP BY e.nombre
    ORDER BY num_versiones;

--Detalle de las versiones
CREATE OR REPLACE VIEW Info_versiones AS
    SELECT 
        e.nombre as evento , 
        v.idVersion as idV,
        v.fechaInicio as fechaI,
        v.fechaFin as fechaF ,
        s.nombre as sede ,
        u.ciudad as ciudad
     FROM 
        Versiones v ,
        EventosDeportivos e ,
        sedes s , 
        ubicaciones u
    WHERE v.evento = e.idEvento
    AND s.idSede = v.sede
    AND u.direccion = s.ubicacion;      