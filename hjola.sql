use mydb;

CREATE VIEW vista_tarea_activa
AS SELECT
	id_tarea,
    tarea_nombre,
    tarea_descripcion
FROM tarea;


CREATE VIEW vista_tarea_cancelada
as select 
	id_tarea,
    tarea_nombre,
    tarea_descripcion
from tarea: