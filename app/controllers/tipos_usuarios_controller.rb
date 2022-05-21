class TiposUsuariosController < ApplicationController
  def all_tipos_usuarios
    if autorizar_accion(0)
      render json: { status: true, message: TiposUsuario.all }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end
end
