# Proyecto base de Datos 


### Procedimiento `horas_trabajadas`

Este procedimiento obtiene el número de horas trabajadas por un integrante.

#### Parámetros:

- `p_id_integrante`: Identificador del integrante para el cual se desea obtener el número de horas trabajadas.

#### Uso:

```sql
CALL horas_trabajadas(1);
```

---

### Procedimiento `marcar_tarea_completada`

Este procedimiento marca una tarea como terminada.

#### Parámetros:

- `p_id_tarea`: Identificador de la tarea que se desea marcar como completada.

#### Uso:

```sql
CALL marcar_tarea_completada(1);
```

---

### Procedimiento `agregar_prorroga`

Este procedimiento agrega días extras a la duración de una tarea.

#### Parámetros:

- `p_id_tarea`: Identificador de la tarea a la que se le agregarán días extras.
- `p_duracion_prorroga`: Duración en días que se agregarán a la tarea.

#### Uso:

```sql
CALL agregar_prorroga(1, 5);
```

---

### Procedimiento `control_integrante`

Este procedimiento se utiliza para marcar la entrada o salida de un integrante.

#### Parámetros:

- `p_integrante_id`: Identificador del integrante al que se le marcará la entrada o salida.

#### Uso:

```sql
CALL control_integrante(1);
```

---

### Procedimiento `crear_integrante`

Este procedimiento crea un nuevo integrante en el equipo.

#### Parámetros:

- `p_nombre`: Nombre del nuevo integrante.
- `p_email`: Email del nuevo integrante.
- `p_salario`: Salario del nuevo integrante.
- `p_equipo_id`: ID del equipo al que pertenece el nuevo integrante.

#### Uso:

```sql
CALL crear_integrante('Juan Perez', 'juan@example.com', 50000, 1);
```

---

### Procedimiento `crear_equipo`

Este procedimiento crea un nuevo equipo.

#### Parámetros:

- `p_nombre`: Nombre del nuevo equipo.

#### Uso:

```sql
CALL crear_equipo('Equipo de Desarrollo');
```

---

### Procedimiento `crear_tarea`

Este procedimiento crea una nueva tarea.

#### Parámetros:

- `p_inicio`: Fecha de inicio de la tarea.
- `p_nombre`: Nombre de la tarea.
- `p_descripcion`: Descripción de la tarea.
- `p_duracion`: Duración estimada de la tarea.

#### Uso:

```sql
CALL crear_tarea('2023-11-28', 'Desarrollo de Funcionalidad X', 'Implementar nuevas características', 10);
```

---

### Procedimiento `asignar_equipo_tarea`

Este procedimiento asigna un equipo a una tarea existente.

#### Parámetros:

- `p_id_equipo`: ID del equipo que se asignará a la tarea.
- `p_id_tarea`: ID de la tarea a la que se asignará el equipo.

#### Uso:

```sql
CALL asignar_equipo_tarea(1, 2);
```

---

### Procedimiento `asignar_integrante_tarea`

Este procedimiento asigna un integrante a una tarea existente.

#### Parámetros:

- `p_id_integrante`: ID del integrante.
- `p_id_tarea`: ID de la tarea a la que se asignará el integrante.

#### Uso:

```sql
CALL asignar_integrante_tarea(1, 3);
```

Recuerda ajustar los valores de los parámetros según tus necesidades específicas.