class ProductosController < ApplicationController
  skip_before_action :authenticate_request
  def all_productos
    render json: { status: true, message: Producto.all }, status: 200
  end
end
