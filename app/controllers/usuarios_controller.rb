class UsuariosController < ApplicationController

  def register
    user = User.new(user_params)
    if user.valid? && user.save
      render json: user, status: 201
      return
    end
    render json: user.errors, status: 400
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :Nombre,
      :NumTelefono,
      :tipos_usuarios
    )
  end
end
