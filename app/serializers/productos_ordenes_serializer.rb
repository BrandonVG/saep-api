class ProductosOrdenesSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :nombre,
    :descripcion,
    :precioPublico,
    :precioMayoreoPublico,
    :precioMaquila,
    :precioMayoreoMaquila,
    :cantidad
  )
  def cantidad
    relation = object.ordenes_productos.find_by(ordenes_id: @instance_options[:ordenes_id])
    p relation
    relation.Cantidad
  end
end
