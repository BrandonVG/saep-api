class ProductoSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :nombre,
    :pescripcion,
    :precioPublico,
    :precioMayoreoPublico,
    :precioMaquila,
    :precioMayoreoMaquila
  )
end
