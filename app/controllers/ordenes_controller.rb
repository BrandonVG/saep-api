class OrdenesController < ApplicationController
  skip_before_action :authenticate_request
  def create
    orden = Ordene.new(orden_create_params, estados_ordenes_id: 1, users_id: @current_user.id)
    if orden.valid? && orden.save
      render json: { status: true, message: orden }, status: 201
      return
    end
    render json: { status: false, message: orden.errors }, status: 400
  end

  def update
    if (orden = Ordene.find(params[:id])) && autorizar_accion(orden.users_id)
      if orden.update(orden_update_params)
        render json: { status: true, message: orden }, status: 201
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def all_orders_get
    if autorizar_accion(0)
      if (ordenes = Ordene.all)
        render json: { status: true, message: ordenes }, status: 200
        return
      end
      render json: { status: false, message: ordenes.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def order_by_id_get
    if autorizar_accion(0)
      if (orden = Ordene.find(params[:id]))
        render json: { status: true, message: orden }, status: 200
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def delete
    if autorizar_accion(0)
      if (orden = Ordene.find(params[:id])) && orden.destroy
        render json: { status: true, message: orden }, status: 200
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def orders_by_status_get
    if autorizar_accion(0)
      if (ordenes = Ordene.where(estados_ordenes_id: params[:status]))
        render json: { status: true, message: ordenes }, status: 200
        return
      end
      render json: { status: false, message: ordenes.errors }, status: 400
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def order_by_status_get
    if autorizar_accion(0)
      if (orden = Ordene.find_by(estados_ordenes_id: params[:status]))
        render json: { status: true, message: orden }, status: 200
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  private

  def orden_create_params
    params.require(:orden).permit(
      :Costo,
      :Descripcion,
      :Cantidad,
      :Anticipo,
      :Diseño,
      :tipos_trabajos_id
    )
  end

  def orden_update_params
    params.require(:orden).permit(
      :Costo,
      :Descripcion,
      :Cantidad,
      :Diseño,
      :estados_ordenes_id
    )
  end
end
