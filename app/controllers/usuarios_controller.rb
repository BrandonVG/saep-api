class UsuariosController < ApplicationController
  skip_before_action :authenticate_request, only: [:login, :register]

  def register
    user = User.new(user_params)
    if user.tipos_usuarios_id == 4 || user.tipos_usuarios_id == 5
      if user.valid? && user.save
        access_token = AccessToken.encode({ user_id: user.id })
        render json: user, meta: { access_token: access_token }, status: 201
        return
      end
      render json: user.errors, status: 400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def login
    email = login_params[:email]
    pass = login_params[:password]
    user = User.find_by(email: email)
    is_valid = user && user.valid_password?(pass)
    unless is_valid
      render json: { status: 'error', message: 'Credenciales erroneas' }, status: 400 and return
    end

    payload = { user_id: user.id }
    access_token = AccessToken.encode(payload)
    render json: user, meta: { access_token: access_token }, status: 200
  end

  def users_get
    if autorizar_accion(0)
      if (users = User.all.where.not(tipos_usuarios_id: 1))
        render json: users, status: 200
        return
      end
      render json: users.errors, status: 404
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def user_get
    if autorizar_accion(params[:id])
      if (user = User.find(params[:id]))
        render json: user, status: 200
        return
      end
      render json: user.errors, status: 404
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def create_user
    if autorizar_accion(0)
      user = User.new(user_params)
      if user.valid? && user.save
        render json: user, status: 201
        return
      end
      render json: user.errors, status: 400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def update_user
    if autorizar_accion(params[:id])
      if (user = User.find(params[:id])) && user.update(user_update_params)
        render json: user, status: 201
        return
      end
      render json: user.errors, status: 400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  def delete_user
    if autorizar_accion(params[:id])
      if (user = User.find(params[:id])) && user.destroy
        render json: user, status: 200
        return
      end
      render json: user.errors, status: 400
      return
    end
    render json: { error: 'No Autorizado' }, status: 401
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :Nombre,
      :NumTelefono,
      :tipos_usuarios_id
    )
  end

  def user_update_params
    params.require(:user).permit(
      :Nombre,
      :NumTelefono
    )
  end

  def login_params
    params.require(:user).permit(
      :email,
      :password
    )
  end
end
