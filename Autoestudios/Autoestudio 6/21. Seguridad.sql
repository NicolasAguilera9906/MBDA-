--Seguridad
create role elAdministrador;
create role musicos;

grant execute on PA_MUSICO to musicos;
grant execute on PA_ADMINISTRADOR to elAdministrador;