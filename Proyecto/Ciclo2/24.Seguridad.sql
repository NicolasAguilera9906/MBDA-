create role GerenteC2;
create role Jeje_PublicidadC2;
create role Jefe_LogisticaC2;
create role ClienteC2;

grant execute on PA_CLIENTE to ClienteC2;
grant execute on PA_GERENTE to GerenteC2;
grant execute on PA_JEFEPUBLICIDAD to Jeje_PublicidadC2;
grant execute on PA_JEFELOGISTICA to Jefe_LogisticaC2;

GRANT ClienteC2 to bd2156625;
GRANT GerenteC2 to bd2156625;
GRANT Jeje_PublicidadC2 to bd2156625;
GRANT Jefe_LogisticaC2 to bd2156625;