use mydb;


DELIMITER %%
DROP TRIGGER IF EXISTS before_update_duracion_tarea %%
CREATE TRIGGER before_update_duracion_tarea
BEFORE UPDATE ON tarea
FOR EACH ROW
BEGIN
    IF NEW.tarea_duracion != OLD.tarea_duracion THEN
        INSERT INTO historial_prorroga (
			tarea_id_tarea,
            historal_prorroga_duracion
		)
        VALUES (
			NEW.id_tarea,
            NEW.tarea_duracion - OLD.tarea_duracion
		);
    END IF;
END 
%%



/**
 * @autor Luis Eduardo Galindo Amaya
 * Agrega el salario nuevo al historial.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_update_salario %%
CREATE TRIGGER after_update_salario
AFTER UPDATE ON integrante
FOR EACH ROW
BEGIN
    IF NEW.integrante_salario != OLD.integrante_salario THEN
        INSERT INTO historial_salario (
			historial_salario_anterior, 
            historial_salario_siguiente, 
            id_integrante
		)
        VALUES (
			OLD.integrante_salario,
            NEW.integrante_salario,
            NEW.id_integrante
		);
    END IF;
END;
%%

/**
 * @autor Luis Eduardo Galindo Amaya
 * Agrega el salario de un integrante al historial.
 */
DELIMITER %%
DROP TRIGGER IF EXISTS after_insert_integrante %%
CREATE TRIGGER after_insert_integrante
AFTER INSERT
ON integrante FOR EACH ROW
BEGIN
    INSERT INTO historial_salario (
		historial_salario_anterior,
		historial_salario_siguiente,
		id_integrante
	)
	VALUES (
		0,
        new.integrante_salario,
		new.id_integrante
	);
END 
%%
