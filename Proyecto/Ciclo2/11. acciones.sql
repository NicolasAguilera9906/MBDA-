--Si se elimina un evento , tambi�n se eliminan sus versiones.
ALTER TABLE versiones
DROP CONSTRAINT FK_VERSIONES_EVENTO;
ALTER TABLE versiones
ADD CONSTRAINT FK_VERSIONES_EVENTO
FOREIGN KEY(evento)REFERENCES EventosDeportivos(idEvento) on delete cascade;