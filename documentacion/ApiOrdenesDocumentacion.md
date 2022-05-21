# Ordenes

##  **Url_base**:
https://api-saep.herokuapp.com/ordenes

## Crear
**Método**: POST

**Url**: **[Url base](#"Url_base)**/create

**Datos de entrada**: Js_on de orden

**Datos a enviar**:
  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| Descripcion   | string | si          |
| Anticipo      | string | si          |
| tipos_trabajo_id | int | si          |
| productos      | array de JSONs de productos | si          |


**Productos**: El json de los productos debe llevar

| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| id_producto   | int    | si          |
| cantidad      | int | si          |

**Ejemplo JSON a enviar**:
````
{
    "orden":{
        "Descripcion": "Producto de prueba bien mamalon asi para probar bien vergas como esta descripcion bien vergas osiosi"
        "Anticipo": 200,
        "tipos_trabajos_id": 1,
        "productos":[
            {
                "id_producto": 1,
                "cantidad": 2
            },
            {
                "id_producto": 2,
                "cantidad": 2
            },
            {
                "id_producto": 3,
                "cantidad": 2
            }
        ]
    }
}
````

**Respuesta**:
En caso de recibir una peticion correcta regresa un JSON con status true, un message con la orden y código de estado 201.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400
En caso de peticion sin estar logeado regresa un JSON con status false, un message "No autorizado" y
codigo de estado 201
````
Ejemplos: 
-Petición correcta:
{
    "status": true,
    "message": {
        "id": 24,
        "Costo": 306,
        "Descripcion": "Producto de prueba bien mamalon asi para probar bien vergas como esta descripcion bien vergas osiosi",
        "Cantidad": 5,
        "Anticipo": 200,
        "Diseño": null,
        "productos": [
            {
                "id": 1,
                "Nombre": "Producto 0",
                "Descripcion": "Este es el producto No.0",
                "PrecioPublico": 50,
                "PrecioMayoreoPublico": 30,
                "PrecioMaquila": 40,
                "PrecioMayoreoMaquila": 20,
                "cantidad": 2
            },
            {
                "id": 2,
                "Nombre": "Producto 1",
                "Descripcion": "Este es el producto No.1",
                "PrecioPublico": 51,
                "PrecioMayoreoPublico": 31,
                "PrecioMaquila": 41,
                "PrecioMayoreoMaquila": 21,
                "cantidad": 2
            },
            {
                "id": 3,
                "Nombre": "Producto 2",
                "Descripcion": "Este es el producto No.2",
                "PrecioPublico": 52,
                "PrecioMayoreoPublico": 32,
                "PrecioMaquila": 42,
                "PrecioMayoreoMaquila": 22,
                "cantidad": 2
            }
        ]
    }
}
-Petición incorrecta:
{
	status: false,
	"message":"estados_ordenes":{
		"EstadosOrdene should exist"
	}
}
-Peticion sin estar logeado
{
	status: false,
	"message": "No autorizado"
}
````
## Modificar orden

**Método**: POST

**Url**: ***[Url base](#"Url_base)***/update/id

**Datos de entrada**: Json de orden

**Datos a enviar**:
  
| Campo         | tipo   | obligatorio |
| ------------- | ------ | ----------- |
| Costo         | int    | no          |
| Descripcion   | string | no          |
| estados_ordenes_id | int | no          |

**Ejemplo JSON a enviar**:
````
{
    "orden":{
				"Costo":250
        "Descripcion": "Producto de prueba bien mamalon asi para probar bien vergas como esta descripcion bien vergas osiosi"
				"estados_ordenes_id": 2
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
## Eliminar orden

**Método**: Delete

**Url**: **[Url base](#"Url_base)**/delete/id

**Datos de entrada**: id en el url y Bearer token en el header

**Importante**: Solamente el administrador puede eleminar ordenes

**Respuesta**:
En caso de recibir una peticion correcta  elimina la orden, regresa un JSON con la orden, status true y código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401

````
Ejemplos: 
-Petición correcta:
{
    "status": true,
    "message": {
        "id": 24,
        "Costo": 306,
        "Descripcion": "Producto de prueba bien mamalon asi para probar bien vergas como esta descripcion bien vergas osiosi",
        "Cantidad": 5,
        "Anticipo": 200,
        "Diseño": null,
        "productos": [
            {
                "id": 1,
                "Nombre": "Producto 0",
                "Descripcion": "Este es el producto No.0",
                "PrecioPublico": 50,
                "PrecioMayoreoPublico": 30,
                "PrecioMaquila": 40,
                "PrecioMayoreoMaquila": 20,
                "cantidad": 2
            },
            {
                "id": 2,
                "Nombre": "Producto 1",
                "Descripcion": "Este es el producto No.1",
                "PrecioPublico": 51,
                "PrecioMayoreoPublico": 31,
                "PrecioMaquila": 41,
                "PrecioMayoreoMaquila": 21,
                "cantidad": 2
            },
            {
                "id": 3,
                "Nombre": "Producto 2",
                "Descripcion": "Este es el producto No.2",
                "PrecioPublico": 52,
                "PrecioMayoreoPublico": 32,
                "PrecioMaquila": 42,
                "PrecioMayoreoMaquila": 22,
                "cantidad": 2
            }
        ]
    }
}
-Petición incorrecta:
{
	status: false,
	"message":"error"
	
}
-Peticion sin estar logeado
{
	status: false,
	"message": "No autorizado"
}
````
## Obtener todas las ordenes

**Método**: GET

**Url**: **[Url base](#"Url_base)**

**Datos de entrada**: Bearer token en el header

**Importante**: Solamente el administrador y empleado A pueden acceder a todas las ordenes, al empleado B
regresa todas las ordenes en proceso y a los clientes solo sus ordenes.

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos las ordenes, status true código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401

## Obtener todas las ordenes por estatus

**Método**: GET

**Url**: **[Url base](#"Url_base)**/status/id_status

**Datos de entrada**: Bearer token en el header y id de estado de orden

**Importante**: Solamente el administrador y empleado A pueden acceder a todas las ordenes por estado

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos las ordenes, status true código de estado 200.
En caso de peticion incorrecta regresa un JSON con los errores, status false y código de estado 400.
En caso de no ser administrador regresara No autorizado, status false y código de estado 401


## Obtener orden por id

**Método**: GET

**Url**: **[Url base](#"Url_base)**/id

**Datos de entrada**: id en el url y Bearer token en el header

**Importante**: Solamente el administrador puede buscar una orden

**Respuesta**:
En caso de recibir una peticion correcta  regresa un JSON con todos los usuarios código de estado 200.
En caso de peticion incorrecta y no encontrar al usuario regresa un JSON con los errores y código de estado 404.
En caso de no ser administrador o no estar logeado como administrador regresara No autorizado y código de estado 401
