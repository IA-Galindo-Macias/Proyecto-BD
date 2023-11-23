use mydb;

/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea un nuevo integrante en el equipo.
 * 
 * @param p_nombre      Nombre del nuevo integrante.
 * @param p_email       Email del nuevo integrante.
 * @param p_salario     Salario del nuevo integrante.
 * @param p_equipo_id   ID del equipo al que pertenece.
 */
DELIMITER %%
CREATE PROCEDURE crear_integrante(
	IN p_nombre VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_salario INT,
    IN p_equipo_id INT
)
BEGIN
	INSERT INTO integrante(
		integrante_nombre,
		integrante_email,
        integrante_salario,
        equipo_id_equipo
    )
	VALUES (
		p_nombre,
		p_email,
        p_salario,
        p_equipo_id
	);
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea un nuevo equipo.
 *
 * @param p_nombre Nombre del nuevo equipo.
 */
DELIMITER %%
CREATE PROCEDURE crear_equipo(
	IN p_nombre VARCHAR(45)
)
BEGIN
	INSERT INTO equipo (
        equipo_nombre, 
        equipo_estatus
    ) 
    VALUES (
        p_nombre, 
        "activo"
    );
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Crea una nueva tarea.
 *
 * @param p_inicio       Fecha de inicio de la tarea.
 * @param p_nombre       Nombre de la tarea.
 * @param p_descripcion  Descripción de la tarea.
 * @param p_duracion     Duración estimada de la tarea.
 */
DELIMITER %%
CREATE PROCEDURE crear_tarea(
    IN p_inicio DATETIME,
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(255),
    IN p_duracion INT
)
BEGIN
    INSERT INTO tarea (
        tarea_inicio,
        tarea_nombre,
        tarea_descripcion,
        tarea_duracion,
        tarea_status
    )
    VALUES (
        p_inicio,
        p_nombre,
        p_descripcion,
        p_duracion,
        "pendiente"
	);
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Asigna un equipo a una tarea existente.
 *
 * @param p_id_equipo ID del equipo a asignar.
 * @param p_id_tarea  ID de la tarea a la que se asignará el equipo.
 */
DELIMITER %%
CREATE PROCEDURE asignar_equipo_tarea(
    IN p_id_equipo INT,
    IN p_id_tarea INT
)
BEGIN
    UPDATE tarea
    SET equipo_id_equipo = p_id_equipo
    WHERE id_tarea = p_id_tarea;
END
%%


/**
 * @autor Luis Eduardo Galindo Amaya
 * Asigna un integrante a una tarea existente.
 *
 * @param p_id_integrante ID del integrante.
 * @param p_id_tarea      ID de la tarea a la que se asignará.
 * @return Mensaje indicando si la asignación fue exitosa o no.
 */
DELIMITER %%    
CREATE PROCEDURE asignar_integrante_tarea(
    IN p_id_integrante INT,
    IN p_id_tarea INT
)
BEGIN
    DECLARE v_id_equipo INT;
    DECLARE v_id_equipo_integrante INT;
    
    -- equipo al que pertenece la tarea
    SELECT equipo_id_equipo INTO v_id_equipo
    FROM tarea
    WHERE id_tarea = p_id_tarea;
    
    -- equipo al que pertenece el integrante
    SELECT equipo_id_equipo INTO v_id_equipo_integrante
    FROM integrante
    WHERE id_integrante = p_id_integrante;
    
    -- Verificar si el integrante pertenece al equipo de la tarea
    IF v_id_equipo = v_id_equipo_integrante THEN
        -- Asignar la tarea al integrante
        UPDATE tarea
        SET integrante_id_integrante = p_id_integrante,
            tarea_status = 'pendiente'
        WHERE id_tarea = p_id_tarea;
        
        SELECT 'Tarea asignada correctamente' AS mensaje;        
    ELSE
        SELECT 'El integrante no pertenece al equipo de la tarea' AS mensaje;
    END IF;
END
%%