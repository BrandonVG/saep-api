class OrdeneSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :Costo,
    :Descripcion,
    :FechaCreacion,
    :Cantidad,
    :FechaEntrega,
    :Anticipo,
    :Diseño
  )
end