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
  belongs_to :User
  def productos
    object.productos.map do |prod|
      ::ProductosOrdenesSerializer.new(prod, ordenes_id: object.id)
    end
  end
end
