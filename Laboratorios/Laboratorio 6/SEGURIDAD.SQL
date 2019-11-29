--Rol Administradores
CREATE ROLE AdministradorAF;
grant AdministradorAF to bd2156625;
GRANT EXECUTE ON PA_ADMINISTRADOR TO AdministradorAF;

--Rol Participante
CREATE ROLE ParticipantesAF;
grant ParticipantesAF to bd2103370;
grant ParticipantesAF to bd2103488;
GRANT EXECUTE ON PA_PARTICIPANTES TO ParticipantesAF;
