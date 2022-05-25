# Tipos de usuarios

##  **Url_base**:
https://api-saep.herokuapp.com/tipos_usuarios

## Obtener todos los tipos de usuarios

**Método**: GET

**Url**: **[Url base](#"Url_base)**

**Datos de entrada**: Bearer token en el header

**Importante**: Solamente el administrador puede acceder a todos los tipos de usuarios.

**Tipos de usuarios**:
| id         | Rol   | 
| ------------- | ------ |
| 1         | Administrador |
| 2         | Empleado A |
| 3         | Empleado B |
| 4         | Cliente    |

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los tipos de usuarios, status true y código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401