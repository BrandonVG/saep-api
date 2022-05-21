# Tipos de trabajos

##  **Url_base**:
https://api-saep.herokuapp.com/tipos_trabajo

## Obtener todos los tipos de usuarios

**Método**: GET

**Url**: **[Url base](#"Url_base)**

**Datos de entrada**: Bearer token en el header del JSON

**Importante**: Todos pueden acceder a los tipos de trabajos mientras se este logeado

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los tipos de trabajos, status true y código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401