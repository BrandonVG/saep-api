class OrdenesController < ApplicationController
  skip_before_action :authenticate_request
  def create
  end

  def update
  end

  def all_orders_get
    if autorizar_accion(0)
      if (ordenes = Ordene.all)
        render json: ordenes, status: 200
        return
      end
      render json ordenes.errors, status: 400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def order_by_id_get
    if autorizar_accion(0)
      if (orden = Ordene.find(params[:id]))
        render json: orden, status: 200
        return
      end
      render json: orden.errors, status: 400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def delete
    if autorizar_accion(0)
      if (orden = Ordene.find(params[:id])) && orden.destroy
        render json: orden, status: 200
        return
      end
      render json: orden.errors, status:400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def orders_by_status_get
    if autorizar_accion(0)
      if (ordenes = Ordene.where(estados_ordenes_id: params[:status]))
        render json: ordenes, status: 200
        return
      end
      render json: ordenes.errors, status:400
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def order_by_status_get
    if autorizar_accion(0)
      if (orden = Ordene.find_by(estados_ordenes_id: params[:status]))
        render json: orden, status: 200
        return
      end
      render json: orden.errors, status:400
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  private

  def orden_create_params
    params.require(:orden).permit(
      :Costo,
      :Descripcion,
      :Cantidad,
      :Anticipo,
      :Diseño,
      :users_id,
      :tipos_trabajos_id
    )
  end
end
