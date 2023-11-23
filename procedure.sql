use mydb;

DELIMITER %%
CREATE PROCEDURE crear_equipo(IN nombre_equipo VARCHAR(45))
BEGIN
	INSERT INTO equipo (`equipo_nombre`) VALUES (nombre_equipo);
END
%%

call crear_equipo("Hola");

