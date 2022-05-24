class ProductosController < ApplicationController
  skip_before_action :authenticate_request
  def all_productos
    productos = Producto.all
    prod = ActiveModelSerializers::SerializableResource.new(productos, each_serializer: ProductoSerializer).as_json
    render json: { status: true, message: prod[:productos] }, status: 200
  end
end
