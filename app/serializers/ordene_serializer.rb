class OrdeneSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :Costo,
    :Descripcion,
    :Cantidad,
    :Anticipo,
    :Diseño,
    :productos
  )
  has_many :productos
end
