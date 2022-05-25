# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
TiposUsuario.create([{ tipo: 'Admin' }, { tipo: 'Empleado A' }, { tipo: 'Empleado B' }, { tipo: 'Cliente' }])

10.times do |i|
  TiposTrabajo.create(Tipo: "Tipo de trabajo de prueba #{i}")
end

EstadosOrdene.create([{ Estado: 'Pendiente' }, { Estado: 'En proceso' }, { Estado: 'Listo' }, { Estado: 'Rechazado' },
                      { Estado: 'Aceptado' }])

20.times do |i|
  Producto.create(Nombre: "Producto #{i}", Descripcion: "Este es el producto No.#{i}", PrecioPublico: 50 + i,
                  PrecioMaquila: 40 + i, PrecioMayoreoPublico: 30 + i, PrecioMayoreoMaquila: 20 + i)
end

User.create(email: 'admin@admin.com', token_auth: '123', tipos_usuarios_id: 1)
User.create(email: 'frodriguez13@ucol.mx', token_auth: 'Czee0I5GhMQ9M2anb5SF28YDM842', tipos_usuarios_id: 1)
User.create(email: 'bvadillo0@ucol.mx', token_auth: 'sUqtj2pW5Ef26uw9Q9px2IUcXuX2', tipos_usuarios_id: 1)
