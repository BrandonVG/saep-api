class ProductoSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :nombre,
    :descripcion,
    :precioPublico,
    :precioMaquila,
    :descuentoMaquila
  )
end
