class ProductosController < ApplicationController
  def all_productos
    render json: { status: true, message: Producto.all }, status: 200
  end
end
