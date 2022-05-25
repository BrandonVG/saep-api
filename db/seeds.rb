# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
TiposUsuario.create([{ tipo: 'Admin' }, { tipo: 'Empleado A' }, { tipo: 'Empleado B' }, { tipo: 'Cliente' }])

EstadosOrdene.create([{ Estado: 'Pendiente' }, { Estado: 'En proceso' }, { Estado: 'Listo' }, { Estado: 'Rechazado' },
                      { Estado: 'Aceptado' }])
Producto.create([{ nombre: '', descripcion: '', precioPublico: '', precioMaquila:'', precioMayoreoPublico: '', precioMayoreoMaquila: '' },
                 { nombre: 'Lona 13 onzas alta resolución', descripcion: 'De 1 a 3/4 M2 se cobra metro completo (1m2 a .76)', precioPublico: '98', precioMaquila:'65', precioMayoreoPublico: '98', precioMayoreoMaquila: '65' },
                 { nombre: 'Lona 13 onzas alta resolución', descripcion: 'Menos de 3/4 hasta 1/2 M2 el costo es el 40% extra (.75 a .51)', precioPublico: '137', precioMaquila:'91', precioMayoreoPublico: '137', precioMayoreoMaquila: '91' },
                 { nombre: 'Lona 13 onzas alta resolución', descripcion: 'Menos de 1/2 hasta 1/4 M2 el costo es 60% extra (.50 a .25)', precioPublico: '', precioMaquila:'', precioMayoreoPublico: '', precioMayoreoMaquila: '' } ])
User.create(email: 'admin@admin.com', token_auth: '123', tipos_usuarios_id: 1)
User.create(email: 'frodriguez13@ucol.mx', token_auth: 'Czee0I5GhMQ9M2anb5SF28YDM842', tipos_usuarios_id: 1)
User.create(email: 'bvadillo0@ucol.mx', token_auth: 'sUqtj2pW5Ef26uw9Q9px2IUcXuX2', tipos_usuarios_id: 1)
