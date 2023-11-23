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