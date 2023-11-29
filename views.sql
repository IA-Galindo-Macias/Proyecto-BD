use mydb;


CREATE OR REPLACE VIEW vista_tareas_pendientes AS
SELECT
    id_tarea,
    tarea_inicio,
    tarea_nombre,
    tarea_descripcion,
    tarea_duracion,
    tarea_status,
    integrante_nombre
FROM
    tarea
    INNER JOIN integrante
    ON integrante_id_integrante = id_integrante
WHERE
	tarea_status = 'PENDIENTE';


-- 0 terminado
-- 1 activo

-- CREATE VIEW vista_tarea_activa
-- AS SELECT *
-- FROM tarea 
-- where 
-- 	tarea_status=1;


-- CREATE VIEW vista_tarea_cancelada
-- as select *
-- from tarea
-- where 
-- 	tarea_status=0;
    
