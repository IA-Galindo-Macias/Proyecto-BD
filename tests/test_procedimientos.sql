use mydb;

select * from integrante;
select * from tarea;
select * from equipo;
select * from historial_salario;
select * from control_horario;
select * from historial_prorroga;

UPDATE integrante SET integrante_salario = 400 WHERE id_integrante = 1;

call agregar_prorroga(1, 10);
call control_integrante(1);
call asignar_equipo_tarea(1,1);
call asignar_integrante_tarea(1, 1);
-- call equipo_integrante(2);
call crear_integrante("pepe", "pepe@12", 100, 1);

call crear_tarea(
    '2023-11-22 12:00:00',
    'Tarea1',
    'Descripcion de Tarea1',
    5
);
