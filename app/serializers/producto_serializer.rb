class ProductoSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :Nombre,
    :Descripcion,
    :PrecioPublico,
    :PrecioMayoreoPublico,
    :PrecioMaquila,
    :PrecioMayoreoMaquila
  )
end
