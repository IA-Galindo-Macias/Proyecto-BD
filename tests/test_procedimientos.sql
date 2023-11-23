use mydb;

select * from integrante;
select * from tarea;
select * from equipo;
select * from historial_salario;

call asignar_equipo_tarea(1,1);
call asignar_integrante_tarea(1, 1);
-- call equipo_integrante(2);
call crear_integrante("pepe", "pepe@12", 100, 1);
