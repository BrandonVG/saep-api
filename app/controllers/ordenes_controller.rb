class OrdenesController < ApplicationController
  def create
    orden = crear_orden(orden_create_params_finals.except(:productos, :correo), orden_create_params_finals[:correo])
    prods = orden_create_params[:productos]
    if orden.valid? && orden.save
      prods.each do |prod|
        OrdenesProducto.create(ordenes_id: orden.id, productos_id: prod[:idProducto], Cantidad: prod[:cantidad])
      end
      render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 201
      return
    end
    render json: { status: false, message: ErrorsHandler.hand_errors(orden.errors) }, status: 400
  end

  def update
    if (orden = Ordene.find(params[:id])) && autorizar_accion_ordenes(orden.users_id)
      if orden.update(orden_update_params)
        render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 201
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(orden.errors) }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def all_orders_get
    if (ordenes = obtener_ordenes)
      od = ActiveModelSerializers::SerializableResource.new(ordenes, each_serializer: OrdeneSerializer).as_json
      render json: { status: true, message: od[:ordenes] }, status: 200
      return
    end
    render json: { status: false, message: ErrorsHandler.hand_errors(ordenes.errors) }, status: 400
  end

  def order_by_id_get
    if autorizar_accion_ordenes(0)
      if (orden = Ordene.find(params[:id]))
        render json: { status: true, message: OrdeneSerializer.new(orden) }, status: 200
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(orden.errors) }, status: 400
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
      render json: { status: false, message: ErrorsHandler.hand_errors(orden.errors) }, status: 400
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def orders_by_status_get
    if autorizar_accion_ordenes(0)
      if (ordenes = Ordene.where(estados_ordenes_id: params[:status]))
        od = ActiveModelSerializers::SerializableResource.new(ordenes, each_serializer: OrdeneSerializer).as_json
        render json: { status: true, message: od[:ordenes] }, status: 200
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(ordenes.errors) }, status: 400
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end


  private

  def orden_create_params
    params.require(:orden).permit(
      :Costo,
      :Descripcion,
      :Anticipo,
      # :Diseño,
      :tipos_trabajos_id,
      :estados_ordenes_id,
      :FechaCreacion,
      :correo,
      productos: [:idProducto, :cantidad]
    )
  end

  def orden_create_params_finals
    orden_create_params.merge(estados_ordenes_id: 1, FechaCreacion: DateTime.now, Costo: cotizar(orden_create_params[:productos]))
  end

  def orden_update_params
    params.require(:orden).permit(
      :Costo,
      :Descripcion,
      # :Diseño,
      :estados_ordenes_id
    )
  end

  def cotizar(productos)
    total = 0
    productos.each do |p|
      producto = Producto.find(p[:idProducto])
      total += producto.PrecioPublico * p[:cantidad]
    end
    total
  end

  def obtener_ordenes
    if @current_user.id == 1 || @current_user.id == 2
      Ordene.all
      return
    elsif @current_user.id == 3
      Ordene.where(estados_ordenes_id: 2)
      return
    end
    Ordene.where(users_id: @current_user.id)
  end

  def crear_orden(ord, correo)
    if (@current_user.tipos_usuarios_id == 1 || @current_user.tipos_usuarios_id == 2) && !correo.nil?
      user_exists = user_exists(correo)
      orden = user_exists.ordenes.new(ord)
    else
      orden = @current_user.ordenes.new(ord)
    end
  end

  def user_exists(correo)
    user = User.find_by(email: correo)
    if user
      user
    else
      user = User.new(email: correo, tipos_usuarios_id: 4)
      user.save
      user
    end
  end
end
