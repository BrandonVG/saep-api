class TiposTrabajosController < ApplicationController
  def all_tipos_trabajos
    render json: { status: true, message: TiposTrabajo.all }, status: 200
  end
end
