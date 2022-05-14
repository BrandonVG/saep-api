# Usuarios

##  **Url_base**:
https://api-saep.herokuapp.com/users

## Registrar
**Método**: POST

**Url**: **[Url base](#"Url_base)**/register

**Datos de entrada**: Json de usuario

**Datos a enviar**:
  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| email         | string | si          |
| Nombre        | string | si          |
| NumTelefono   | string | si          |
| password      | string | si          |
| password_confirmation | string | si          |
| tipos_usuarios_id | int    | si     

**Tipos de usuario**: Solo se admiten 2 id de tipo de usuario al registrar     
| id         | Rol   | 
| ------------- | ------ |
| 4         | Cliente público |
| 5         | Cliente maquila |

**Ejemplo JSON a enviar**:
````
{
	"user":{
		"email":"cliente@ejemplo.com",
		"password":"clienteai",
		"password_confirmation": "clienteai",
		"Nombre": "Cliente ejemplo",
		"NumTelefono":"3123027485",
		"tipos_usuarios_id": 4
	}
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con el usuario, en la metadata el token de acceso y código de estado 201.
En caso de peticion incorrecta regresa un JSON con los errores y código de estado 400
En caso de ingresar un id de tipo de usuario que no sea 4 o 5 regresara No autorizado y código de estado 401
````
Ejemplos: 
-Petición correcta:
{
	"user": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"nombre": "Cliente perro",
		"num_telefono": "3123027485",
		"tipos_usuarios_id": 5
	},
	"meta": {
		"access_token": "ey....yX2lkIjoiZDVmZmFlNzAtMDM1Ni00Nzg3L....xYmY1IiwiZXhwIjoxNjUyNDgzMzAwfQ.stvecjI4_....nq5bJzu5B-HdIj7pdDxfc"
	}
}
-Petición incorrecta:
{
	"email":{
		"That email has been taken"
	}
}
-Peticion con id de tipo de usuario incorrecta
{
	"No autorizado"
}
````
## Login

**Método**: POST

**Url**: ***[Url base](#"Url_base)***/login

**Datos de entrada**: Json de usuario

**Datos a enviar**:
  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| email         | string | si          |
| password      | string | si          |

**Ejemplo JSON a enviar**:
````
{
	"user":{
		"email":"cliente@ejemplo.com",
		"password":"clienteai"
	}
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con el usuario, en la metadata el token de acceso y código de estado 200.
En caso de peticion incorrecta regresa un JSON con el mensaje de error "Credenciales erroneas" y código de estado 400
````
Ejemplos: 
-Petición correcta:
{
	"user": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"nombre": "Cliente perro",
		"num_telefono": "3123027485",
		"tipos_usuarios_id": 5
	},
	"meta": {
		"access_token": "ey....yX2lkIjoiZDVmZmFlNzAtMDM1Ni00Nzg3L....xYmY1IiwiZXhwIjoxNjUyNDgzMzAwfQ.stvecjI4_....nq5bJzu5B-HdIj7pdDxfc"
	}
}
-Petición incorrecta:
{
	"status": "error",
	"message": "Credenciales erroneas"
}
````
## Módificar usuario

**Método**: POST

**Url**: **[Url base](#"Url_base)**/update/id

**Datos de entrada**:Json de usuario, id en el url y Bearer token en el 

**Datos a enviar**:
  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| Nombre        | string | no          |
| NumTelefono   | string | no          |

**Importante**: Solamente el administrador puede modificar cualquier usuario y un usuario solamente puede modificarse a si mismo

**Ejemplo JSON a enviar**:

````
{
	"user":{
		"Nombre": "Cliente ejemplo",
		"NumTelefono":"3123027485",
	}
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con el usuario y código de estado 201.
En caso de peticion incorrecta regresa un JSON con los errores y código de estado 400
En caso de no ser administrador o no estar logeado e intentar modificar un a otro usuario regresara No autorizado y código de estado 401
````
Ejemplos: 
-Petición correcta:
{
	"user": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"nombre": "Cliente perro",
		"num_telefono": "3123027485",
		"tipos_usuarios_id": 5
	}
}
-Petición incorrecta:
{
	"nombre":{
		"Name cant be null"
	}
}
-Peticion con sin logear o modificar otro usuario sin ser admin 
{
	"No autorizado"
}
````
## Eliminar usuario

**Método**: Delete

**Url**: **[Url base](#"Url_base)**/delete/id

**Datos de entrada**: id en el url y Bearer token en el header

**Importante**: Solamente el administrador puede eleminar cualquier usuario y un usuario solamente puede eliminarse a si mismo

**Respuesta**:
En caso de recibir una peticion correcta  elimina al usuario, regresa un JSON con el usuario y código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores y código de estado 400.
En caso de no ser administrador o no estar logeado e intentar eliminar a otro usuario regresara No autorizado y código de estado 401

````
Ejemplos: 
-Petición correcta:
{
	"user": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"nombre": "Cliente perro",
		"num_telefono": "3123027485",
		"tipos_usuarios_id": 5
	}
}
-Peticion sin logear o modificar otro usuario sin ser admin 
{
	"No autorizado"
}
````
## Obtener todos los usuarios

**Método**: GET

**Url**: **[Url base](#"Url_base)**

**Datos de entrada**: Bearer token en el header

**Importante**: Solamente el administrador puede acceder a todos los usuarios

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los usuarios código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores y código de estado 400.
En caso de no ser administrador o no estar logeado como administrador regresara No autorizado y código de estado 401

````
Ejemplos: 
-Petición correcta:
{
	"users": [
		{
			"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
			"email": "cliente23@a.i",
			"nombre": "Cliente perro",
			"num_telefono": "3123027485",
			"tipos_usuarios_id": 5
		},
		{
			"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
			"email": "cliente23@a.i",
			"nombre": "Cliente perro",
			"num_telefono": "3123027485",
			"tipos_usuarios_id": 5
		}
	]
}
-Peticion sin logear o modificar otro usuario sin ser admin 
{
	"No autorizado"
}
````
## Obtener usuario

**Método**: GET

**Url**: **[Url base](#"Url_base)**/id

**Datos de entrada**: id en el url y Bearer token en el header

**Importante**: Solamente el administrador puede buscar un usuario

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los usuarios código de estado 200.
En caso de peticion incorrecta y no encontrar al usuario regresa un JSON con los errores y código de estado 404.
En caso de no ser administrador o no estar logeado como administrador regresara No autorizado y código de estado 401

````
Ejemplos: 
-Petición correcta:
{
	"user": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"nombre": "Cliente perro",
		"num_telefono": "3123027485",
		"tipos_usuarios_id": 5
	}
}
-Peticion sin logear o modificar otro usuario sin ser admin 
{
	"No autorizado"
}
````
## Crear usuario

**Método**: POST

**Url**: **[Url base](#"Url_base)**/admin/create

**Datos de entrada**: Json de usuario

**Datos a enviar**:

  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| email         | string | si          |
| Nombre        | string | si          |
| NumTelefono   | string | si          |
| password      | string | si          |
| password_confirmation | string | si  |
| tipos_usuarios_id | int    | si      |

**Tipos de usuario**: El administrador puede agregar cualquier tipo de usuario   
| id         | Rol   | 
| ------------- | ------ |
| 1         | Administrador |
| 2         | Empleado A |
| 3         | Empleado B |
| 4         | Cliente público |
| 5         | Cliente maquila |

**Ejemplo JSON a enviar**:

````
{
	"user":{
		"email":"empleadoA@ejemplo.com",
		"password":"empleadoa1",
		"password_confirmation": "empleadoa1",
		"Nombre": "Empleado A ejemplo",
		"NumTelefono":"3123027485",
		"tipos_usuarios_id": 2
	}
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con el usuario, en la metadata el token de acceso y código de estado 201.
En caso de peticion incorrecta regresa un JSON con los errores y código de estado 400
En caso de intentar agregar un usuario sin ser admin regresa No autorizado y código de estado 401
````
Ejemplos: 
-Petición correcta:
{
	"user": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email":"empleadoA@ejemplo.com",
		"Nombre": "Empleado A ejemplo",
		"NumTelefono":"3123027485",
		"tipos_usuarios_id": 2
	},
}
-Petición incorrecta:
{
	"email":{
		"That email has been taken"
	}
}
-Peticion con id de tipo de usuario incorrecta
{
	"No autorizado"
}
````