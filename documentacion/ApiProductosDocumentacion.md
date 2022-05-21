# Productos

##  **Url_base**:
https://api-saep.herokuapp.com/productos

## Obtener todos los tipos de usuarios

**Método**: GET

**Url**: **[Url base](#"Url_base)**

**Datos de entrada**: 

**Importante**: Todos pueden ver todos los productos incluso sin estar logeados

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los productos, status true y código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401