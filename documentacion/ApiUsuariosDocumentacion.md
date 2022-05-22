# Usuarios

##  **Url_base**:
https://api-saep.herokuapp.com/users

## Login

**Método**: POST

**Url**: ***[Url base](#"Url_base)***/login

**Datos de entrada**: Json de usuario

**Datos a enviar**:
  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| email         | string | si          |
| token_auth      | string | si          |

**Ejemplo JSON a enviar**:
````
{
	"user":{
		"email":"cliente@ejemplo.com",
		"token_auth":"1234"
	}
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con el usuario, el token de acceso, status true y código de estado 200.
En caso de peticion incorrecta regresa un JSON con el mensaje de error "Credenciales erroneas" y código de estado 400
````
Ejemplos: 
-Petición correcta:
{
    "status": true,
    "message": {
        "id": "c158bb8b-b281-4a2c-9672-25866f87be3b",
        "email": "admin@admin.com",
        "tipos_usuarios_id": 1,
        "ordenes": []
    },
    "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiYzE....iZXhwIjoxNjUzMjc5NjkwfQ.0QZzAhVg0PwxD...dt8"
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
| email        | string | no          |
| tipos_usuarios_id   | int | no          |

**Importante**: Solamente el administrador puede modificar a los usuarios

**Ejemplo JSON a enviar**:

````
{
	"user":{
		"email": "cliente23@a.i",
		"tipos_usuarios_id":"3",
	}
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con el usuario, status true y código de estado 201.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400
En caso de no ser administrador regresa No autorizado, status false y código de estado 401
````
Ejemplos: 
-Petición correcta:
{
	"status": true,
	"message": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"tipos_usuarios_id": 3,
		"ordenes": []
	}
}
-Petición incorrecta:
{
	"status":false,
	"message":{
		"email cant be null"
	}
}
-Peticion sin ser admin 
{
	"status":false,
	"message":"No autorizado"
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
	"status": true,
	"message": {
		"id": "d5ffae70-0356-4787-af95-b5a80ee81bf5",
		"email": "cliente23@a.i",
		"tipos_usuarios_id": 3,
		"ordenes": []
	}
}
-Peticion sin ser admin 
{
	"status":false,
	"message":"No autorizado"
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
    "status": true,
    "message": {
        "users": [
            {
                "id": "f9aa61a6-ed26-4ea7-b075-97152f8d54a1",
                "email": "cliente23@a.i",
                "tipos_usuarios_id": 3,
                "ordenes": []
            },
						{
                "id": "f9bc61a6-ed26-4ea7-b075-97152f8d54a1",
                "email": "cliente3@a.i",
                "tipos_usuarios_id": 4,
                "ordenes": []
            }
        ]
    }
}
-Peticion sin ser admin 
{
	"status":false,
	"message":"No autorizado"
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
    "status": true,
    "message": {
        "id": "f9aa61a6-ed26-4ea7-b075-97152f8d54a1",
        "email": "admin@admin.cliente",
        "tipos_usuarios_id": 4,
        "ordenes": []
    }
}
-Peticion sin ser admin 
{
	"status":false,
	"message":"No autorizado"
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
| tipos_usuarios_id | int    | si      |

**Tipos de usuario**: El administrador puede agregar cualquier tipo de usuario   
| id         | Rol   | 
| ------------- | ------ |
| 1         | Administrador |
| 2         | Empleado A |
| 3         | Empleado B |
| 4         | Cliente    |

**Ejemplo JSON a enviar**:

````
{
    "user":{
        "email":"clientea2@p.i",
        "tipos_usuarios_id":2
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
    "status": true,
    "message": {
        "id": "d67063b0-d8b4-47a6-ba2e-ddfb7feb8200",
        "email": "clientea3@p.i",
        "tipos_usuarios_id": 3,
        "ordenes": []
    }
}
-Petición incorrecta:
{
	"status":false,
	"message":{
		"That email has been taken"
	}
}
-Peticion con id de tipo de usuario incorrecta
{
	"status":false,
	"message":"No autorizado"
}
````