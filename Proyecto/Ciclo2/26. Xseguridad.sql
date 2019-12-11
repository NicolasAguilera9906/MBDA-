
revoke execute on PA_CLIENTE from ClienteC2;
revoke execute on PA_GERENTE from GerenteC2;
revoke execute on PA_JEFEPUBLICIDAD from Jeje_PublicidadC2;
revoke execute on PA_JEFELOGISTICA from Jefe_LogisticaC2;

drop role ClienteC2;
drop role GerenteC2;
drop role Jeje_PublicidadC2;
drop role Jefe_LogisticaC2;