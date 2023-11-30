use mydb;

/*
 *
 * reunion natural
 */
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

/*
 *
 * reunion derecha
 */
CREATE OR REPLACE VIEW vista_tareas_canceladas AS
SELECT
    id_tarea,
    tarea_inicio,
    tarea_nombre,
    tarea_descripcion,
    tarea_duracion,
    tarea_status,
    integrante_nombre
FROM
    integrante 
    RIGHT JOIN tarea 
    ON integrante_id_integrante = id_integrante
WHERE 
    tarea_status = 'CANCELADO';
    

/**
left join
*/
CREATE OR REPLACE VIEW vista_tareas_status AS
SELECT
	*
FROM 
	tarea 
    RIGHT JOIN tarea_completada
    ON id_tarea_completa=id_tarea;
