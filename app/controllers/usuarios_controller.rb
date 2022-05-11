class UsuariosController < ApplicationController

  def register
    user = User.new(user_params)
    if user.valid? && user.save
      render json: user, status: 201
      return
    end
    render json: user.errors, status: 400
  end

  def login
    email = login_params[:email]
    pass = login_params[:password]
    user = User.find_by(email: email)
    is_valid = user && user.valid_password?(pass)
    unless is_valid
      render json: { status: 'error', message: 'Credenciales erroneas' }, status: 400 and return
    end
    render json: user, status: 200
  end

  def users_get
    users = User.all
    if users
      render json: users, status: 200
      return
    end
    render json: users.errors, status: 400
  end

  def user_get
    user = User.find(params[:id])
    if user
      render json: user, status: 200
      return
    end
    render json: user.errors, status: 404
  end

  def update_user
    user = User.find(params[:id])
    if user
      if user.update(user_update_params)
        render json: user, status: 201
        return
      end
      render json: user.errors, status: 400
      return
    end
    render json: user.errors, status: 404
  end

  def delete_user
    user = User.find(params[:id])
    if user
      if user.destroy
        render json: user, status: 200
        return
      end
      render json: user.errors, status: 400
      return
    end
    render json: user.errors, status: 404
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
