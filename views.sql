use mydb;

-- 0 terminado
-- 1 activo

CREATE VIEW vista_tarea_activa
AS SELECT *
FROM tarea 
where 
	tarea_status=1;


CREATE VIEW vista_tarea_cancelada
as select *
from tarea
where 
	tarea_status=0;
    
