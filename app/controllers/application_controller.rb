class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    auth_header = request.headers['Authorization']
    regex = /^Bearer /
    auth_header = auth_header.gsub(regex, '') if auth_header
    @current_user = !auth_header.nil? ? AccessToken.get_user_from_token(auth_header) : nil
    render json: { status: false, message: 'No Autorizado o token expirado' }, status: 401 unless @current_user
  end

  def autorizar_accion(id)
    if @current_user.tipos_usuarios_id == 1 || @current_user.id == id
      true
    else
      false
    end
  end

  def autorizar_accion_ordenes(id)
    if @current_user.tipos_usuarios_id == 1 || @current_user.tipos_usuarios_id == 2 || @current_user.id == id
      true
    else
      false
    end
  end
end
