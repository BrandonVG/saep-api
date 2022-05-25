class OrdeneSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :costo,
    :descripcion,
    :anticipo,
    :diseño,
    :fechaCreacion,
    :fechaEntrega,
    :telefono,
    :cliente,
    :estados_ordenes_id,
    :productos
  )
  belongs_to :User
  def productos
    object.productos.map do |prod|
      ::ProductosOrdenesSerializer.new(prod, ordenes_id: object.id)
    end
  end
end
