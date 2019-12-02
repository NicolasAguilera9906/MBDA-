create role ClienteAF;
create role GerenteAF;
create role Jefe_VentasAF;
create role Jefe_BodegasAF;
create role Jefe_LogisticaAF;

grant execute on PA_GERENTE to GerenteAF;
grant execute on PA_CLIENTE to ClienteAF;
grant execute on PA_JEFEVENTAS to Jefe_VentasAF;
grant execute on PA_JEFEBODEGA to Jefe_BodegasAF;
grant execute on PA_JEFELOGISTICA to Jefe_LogisticaAF;