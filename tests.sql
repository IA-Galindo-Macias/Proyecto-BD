-- Inserción de Datos

-- Inserción de un Equipo
INSERT INTO `mydb`.`equipo` (`id_equipo`, `equipo_nombre`) VALUES (1, 'Equipo A');

-- Inserción de un Integrante en un Equipo
INSERT INTO `mydb`.`integrante` (`integrante_nombre`, `integrantecol_email`, `equipo_id_equipo`) VALUES ('Juan Perez', 'juan@example.com', 1);

-- Inserción de un Historial Activo para un Integrante
INSERT INTO `mydb`.`historial_activo` (`historial_activo_anterior`, `historial_activo_siguiente`, `id_integrante`) VALUES (0, 1, 1);

-- Inserción de un Historial Salario para un Integrante
INSERT INTO `mydb`.`historial_salario` (`historial_salario_anterior`, `historial_salario_siguiente`, `id_integrante`) VALUES (50000, 60000, 1);

-- Inserción de un Control Horario para un Integrante
INSERT INTO `mydb`.`control_horario` (`control_horario_entrada`, `id_integrante`) VALUES ('2023-11-22 08:00:00', 1);

-- Inserción de una Tarea asignada a un Integrante y Equipo
INSERT INTO `mydb`.`tarea` (`id_tarea`, `tarea_inicio`, `tarea_nombre`, `tarea_descripcion`, `tarea_duracion`, `tarea_status`, `integrante_id_integrante`, `equipo_id_equipo`) VALUES (1, '2023-11-22 09:00:00', 'Tarea 1', 'Realizar tarea 1', 4, 0, 1, 1);

-- Inserción de un Historial de Prórroga para una Tarea
INSERT INTO `mydb`.`historal_prorroga` (`tarea_id_tarea`, `historal_prorroga_duracion`) VALUES (1, 2);

-- Inserción de una Tarea Completada
INSERT INTO `mydb`.`tarea_completada` (`tarea_completada_marca`, `tarea_id_tarea`) VALUES ('2023-11-22 15:00:00', 1);

-- Consultas

-- Obtener todos los Integrantes de un Equipo
SELECT * FROM `mydb`.`integrante` WHERE `equipo_id_equipo` = 1;

-- Obtener el Historial Activo de un Integrante
SELECT * FROM `mydb`.`historial_activo` WHERE `id_integrante` = 1;

-- Obtener el Salario Actual de un Integrante
SELECT `historial_salario_siguiente` FROM `mydb`.`historial_salario` WHERE `id_integrante` = 1 ORDER BY `historial_salario_marca` DESC LIMIT 1;

-- Obtener las Tareas asignadas a un Equipo
SELECT * FROM `mydb`.`tarea` WHERE `equipo_id_equipo` = 1;

-- Obtener las Tareas Completadas
SELECT * FROM `mydb`.`tarea_completada`;
