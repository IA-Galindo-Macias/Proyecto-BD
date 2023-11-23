use mydb;

/**
 * @autor Luis Eduardo Galindo Amaya
 * Agrega el salario de un integrante al historial.
 * TODO: Agregar el trigger para actualizar el salario actual del integrante.
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
