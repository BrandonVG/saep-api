# Estados Ordenes

##  **Url_base**:
https://api-saep.herokuapp.com/ordenes_estados

## Obtener todos los estados de ordenes

**Método**: GET

**Url**: **[Url base](#"Url_base)**

**Datos de entrada**: Bearer token en el header

**Importante**: Solamente el administrador y empleado A pueden acceder a todos los estados de ordenes.

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los estados de ordenes, status true y código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401