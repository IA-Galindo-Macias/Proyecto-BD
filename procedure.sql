use mydb;


-- -----------------------------------------------------
-- Crear equipos : Luis Eduardo Galindo Amaya
-- -----------------------------------------------------
DELIMITER %%
CREATE PROCEDURE crear_equipo(IN p_nombre VARCHAR(45))
BEGIN
	INSERT INTO equipo (`equipo_nombre`, `equipo_estatus`) 
    VALUES (p_nombre, "activo");
END
%%




-- -----------------------------------------------------
-- Crear tarea : Luis Eduardo Galindo Amaya 
-- -----------------------------------------------------
DELIMITER %%
CREATE PROCEDURE insertar_tarea(
    IN p_inicio DATETIME,
    IN p_nombre VARCHAR(45),
    IN p_descripcion VARCHAR(255),
    IN p_duracion INT,
    IN p_status INT,
    IN p_integrante_id INT,
    IN p_equipo_id INT
)
BEGIN
    INSERT INTO tarea (
        tarea_inicio,
        tarea_nombre,
        tarea_descripcion,
        tarea_duracion,
        tarea_status,
        integrante_id_integrante,
        equipo_id_equipo
    )
    VALUES (
        p_inicio,
        p_nombre,
        p_descripcion,
        p_duracion,
        p_status,
        p_integrante_id,
        p_equipo_id
    );
END
%%