use mydb;

-- --------------------------------------------------------------------
-- Crear equipos
-- --------------------------------------------------------------------

call crear_equipo("Equipo 1");
call crear_equipo("Equipo 2");
call crear_equipo("Equipo 3");
call crear_equipo("Equipo 4");
call crear_equipo("Equipo 5");
call crear_equipo("Equipo 6");
call crear_equipo("Equipo 7");
call crear_equipo("Equipo 8");
call crear_equipo("Equipo 9");
call crear_equipo("Equipo 10");
call crear_equipo("Equipo 11");
call crear_equipo("Equipo 12");
call crear_equipo("Equipo 13");
call crear_equipo("Equipo 14");
call crear_equipo("Equipo 15");

-- --------------------------------------------------------------------
-- Crear integrantes
-- --------------------------------------------------------------------

CALL crear_integrante(
    "Juan Pérez",
    "juan.perez@example.com", 
    50000, 
    1
);

CALL crear_integrante(
    "María García",
    "maria.garcia@example.com", 
    55000, 
    1
);

CALL crear_integrante(
    "Luis Rodríguez",
    "luis.rodriguez@example.com", 
    60000, 
    2
);

CALL crear_integrante(
    "Ana Martínez",
    "ana.martinez@example.com", 
    52000, 
    2
);

CALL crear_integrante(
    "Carlos López",
    "carlos.lopez@example.com", 
    48000, 
    3
);

CALL crear_integrante(
    "Laura Sánchez",
    "laura.sanchez@example.com", 
    51000, 
    3
);

CALL crear_integrante(
    "Pedro Gómez",
    "pedro.gomez@example.com", 
    53000, 
    4
);

CALL crear_integrante(
    "Rosa Díaz",
    "rosa.diaz@example.com", 
    58000, 
    4
);

CALL crear_integrante(
    "Javier Fernández",
    "javier.fernandez@example.com", 
    60000, 
    5
);

CALL crear_integrante(
    "Isabel Ramírez",
    "isabel.ramirez@example.com", 
    52000, 
    5
);

CALL crear_integrante(
    "Miguel Torres",
    "miguel.torres@example.com", 
    48000, 
    6
);

CALL crear_integrante(
    "Sara López",
    "sara.lopez@example.com", 
    51000, 
    6
);

CALL crear_integrante(
    "Alejandro Ruiz",
    "alejandro.ruiz@example.com", 
    53000, 
    7
);

CALL crear_integrante(
    "Elena Herrera",
    "elena.herrera@example.com", 
    58000, 
    7
);

CALL crear_integrante(
    "Víctor Castro",
    "victor.castro@example.com", 
    60000, 
    8
);

-- --------------------------------------------------------------------
-- Crear tareas
-- --------------------------------------------------------------------

CALL crear_tarea(
    '2023-11-23',
    'Desarrollar Módulo de Autenticación', 
    'Implementar el sistema de autenticación para el software', 
    8
);

CALL crear_tarea(
    '2023-11-24',
    'Diseñar Interfaz de Usuario', 
    'Crear el diseño de la interfaz de usuario para la aplicación', 
    6
);

CALL crear_tarea(
    '2023-11-25',
    'Optimizar Código', 
    'Realizar mejoras de rendimiento y optimización en el código', 
    10
);

CALL crear_tarea(
    '2023-11-23',
    'Realizar Pruebas de Integración', 
    'Probar la integración de diferentes módulos del software', 
    7
);

CALL crear_tarea(
    '2023-11-29',
    'Corregir Errores Reportados', 
    'Solucionar bugs y errores identificados durante las pruebas', 
    5
);

CALL crear_tarea(
    '2023-11-22',
    'Desarrollar Funcionalidad de Exportación', 
    'Agregar capacidad de exportar datos a formatos específicos', 
    8
);

CALL crear_tarea(
    '2023-11-27',
    'Configurar Servidor de Despliegue', 
    'Preparar el servidor para la implementación del software', 
    6
);

CALL crear_tarea(
    '2023-11-12',
    'Realizar Capacitación del Personal', 
    'Impartir capacitación sobre el uso del nuevo software', 
    4
);

CALL crear_tarea(
    '2023-11-12',
    'Actualizar Documentación del Software', 
    'Revisar y actualizar la documentación del software', 
    6
);

CALL crear_tarea(
    '2023-11-12',
    'Realizar Pruebas de Aceptación del Cliente', 
    'Ejecutar pruebas para validar que el software cumple con los requisitos del cliente', 
    8
);

CALL crear_tarea(
    '2023-12-03',
    'Preparar Material de Lanzamiento', 
    'Crear presentaciones y material informativo para el lanzamiento del software', 
    7
);

CALL crear_tarea(
    '2023-12-01',
    'Configurar Ambiente de Producción', 
    'Configurar el entorno de producción para el despliegue del software', 
    6
);

CALL crear_tarea(
    '2023-12-01',
    'Realizar Despliegue del Software', 
    'Implementar la nueva versión del software en el ambiente de producción', 
    5
);

CALL crear_tarea(
    '2023-12-02',
    'Monitorear Rendimiento del Sistema', 
    'Establecer herramientas de monitoreo para evaluar el rendimiento del sistema', 
    8
);

CALL crear_tarea(
    '2023-12-02',
    'Realizar Sesión de Retroalimentación', 
    'Recopilar retroalimentación de usuarios para futuras mejoras', 
    4
);

CALL crear_tarea(
    '2023-12-02',
    'Realizar Pruebas de Estrés', 
    'Ejecutar pruebas de estrés para evaluar el rendimiento del sistema', 
    8
);

-- -------------------------------------------------------------------- 
-- asignar tareas
-- --------------------------------------------------------------------

CALL asignar_equipo_tarea(7, 3); --
CALL asignar_equipo_tarea(15, 5);
CALL asignar_equipo_tarea(6, 13); --
CALL asignar_equipo_tarea(9, 10);
CALL asignar_equipo_tarea(12, 2);
CALL asignar_equipo_tarea(4, 1); --
CALL asignar_equipo_tarea(11, 14);
CALL asignar_equipo_tarea(3, 8); --
CALL asignar_equipo_tarea(5, 7); --
CALL asignar_equipo_tarea(13,  15);
CALL asignar_equipo_tarea(10,  6);
CALL asignar_equipo_tarea(2, 9); --
CALL asignar_equipo_tarea(1, 12); --
CALL asignar_equipo_tarea(14,  4);
CALL asignar_equipo_tarea(8, 11); 

-- --------------------------------------------------------------------
-- asignar integrantes
-- --------------------------------------------------------------------

CALL asignar_integrante_tarea(7, 1);
CALL asignar_integrante_tarea(13, 3);
CALL asignar_integrante_tarea(9, 7);
CALL asignar_integrante_tarea(5, 8);
CALL asignar_integrante_tarea(1, 12);
CALL asignar_integrante_tarea(3, 9);
CALL asignar_integrante_tarea(1, 12);
