class OrdenesController < ApplicationController
  def create
    orden = @current_user.ordenes.new(orden_create_params_finals.except(:productos))
    prods_ids = orden_create_params[:productos]
    if orden.valid? && orden.save
      prods_ids.each do |id|
        OrdenesProducto.create(ordenes_id: orden.id, productos_id: id, Cantidad: 1)
      end
      render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 201
      return
    end
    render json: { status: false, message: orden.errors }, status: 400
  end

  def update
    if (orden = Ordene.find(params[:id])) && autorizar_accion_ordenes(orden.users_id)
      if orden.update(orden_update_params)
        render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 201
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def all_orders_get
    if autorizar_accion_ordenes(0)
      if (ordenes = Ordene.all)
        render json: { status: true, message: ActiveModelSerializers::SerializableResource.new(ordenes, each_serializer: OrdeneSerializer) }, status: 200
        return
      end
      render json: { status: false, message: ordenes.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def order_by_id_get
    if autorizar_accion_ordenes(0)
      if (orden = Ordene.find(params[:id]))
        render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 200
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def delete
    if autorizar_accion_ordenes(0)
      if (orden = Ordene.find(params[:id])) && orden.destroy
        render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 200
        return
      end
      render json: { status: false, message: orden.errors }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def orders_by_status_get
    if autorizar_accion_ordenes(0)
      if (ordenes = Ordene.where(estados_ordenes_id: params[:status]))
        render json: { status: true, message: ActiveModelSerializers::SerializableResource.new(ordenes, each_serializer: OrdeneSerializer) }, status: 200
        return
      end
      render json: { status: false, message: ordenes.errors }, status: 400
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
      #:Diseño,
      :tipos_trabajos_id,
      :estados_ordenes_id,
      :FechaCreacion,
      productos: []
    )
  end

  def orden_create_params_finals
    orden_create_params.merge(estados_ordenes_id: 1, FechaCreacion: DateTime.now)
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
