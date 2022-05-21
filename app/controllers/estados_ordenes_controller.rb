class EstadosOrdenesController < ApplicationController
  def all_estados_ordenes
    if autorizar_accion_ordenes(0)
      render json: { status: true, message: EstadosOrdene.all }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end
end
