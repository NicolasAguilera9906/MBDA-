revoke execute on PA_GERENTE from GerenteAF;
revoke execute on PA_CLIENTE from ClienteAF;
revoke execute on PA_JEFEVENTAS from Jefe_VentasAF;
revoke execute on PA_JEFEBODEGA from Jefe_BodegasAF;
revoke execute on PA_JEFELOGISTICA from Jefe_LogisticaAF;

drop role ClienteAF;
drop role GerenteAF;
drop role Jefe_VentasAF;
drop role Jefe_BodegasAF;
drop role Jefe_LogisticaAF;


