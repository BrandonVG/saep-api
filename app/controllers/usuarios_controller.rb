class UsuariosController < ApplicationController
  skip_before_action :authenticate_request, only: [:login]

  def login
    if !login_params[:token_auth].nil?
      user = User.find_by(email: login_params[:email], token_auth: login_params[:token_auth])
      if !user.nil?
        access_token = AccessToken.encode({ user_id: user.id })
        render json: { status: true, message: UserSerializer.new(user), access_token: access_token }, status: 200
      elsif (user = User.find_by(email: login_params[:email])) && !user.nil? && user.tipos_usuarios_id != 1
        user.update(token_auth: login_params[:token_auth]) if user.token_auth.nil?
        access_token = AccessToken.encode({ user_id: user.id })
        render json: { status: true, message: UserSerializer.new(user), access_token: access_token }, status: 200
      else
        user = User.new(register_params)
        if user.save
          access_token = AccessToken.encode({ user_id: user.id })
          render json: { status: true, message: UserSerializer.new(user), access_token: access_token }, status: 200
        else
          render json: { status: false, message: ErrorsHandler.hand_errors(user.errors) }, status: 200
        end
      end
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def users_get
    if autorizar_accion(0)
      if (users = User.all.where.not(tipos_usuarios_id: 1))
        us = ActiveModelSerializers::SerializableResource.new(users, each_serializer: UserSerializer, root: 'message').as_json
        render json: { status: true, message: us[:message] }, status: 200
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(users.errors) }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def user_get
    if autorizar_accion(params[:id])
      if (user = User.find(params[:id]))
        render json: { status: true, message: UserSerializer.new(user) }, status: 200
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(user.errors) }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def create_user
    if autorizar_accion(0)
      user = User.new(create_user_params)
      if user.valid? && user.save
        render json: { status: true, message: UserSerializer.new(user) }, status: 201
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(user.errors) }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def update_user
    if autorizar_accion(0)
      if (user = User.find(params[:id])) && user.update(user_update_params)
        render json: { status: true, message: UserSerializer.new(user) }, status: 201
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(user.errors) }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  def delete_user
    if autorizar_accion(params[:id])
      if (user = User.find(params[:id])) && user.destroy
        render json: { status: true, message: UserSerializer.new(user) }, status: 200
        return
      end
      render json: { status: false, message: ErrorsHandler.hand_errors(user.errors) }, status: 200
      return
    end
    render json: { status: false, message: 'No Autorizado' }, status: 401
  end

  private


  def user_update_params
    params.require(:user).permit(
      :email,
      :tipos_usuarios_id
    )
  end

  def login_params
    params.require(:user).permit(
      :email,
      :token_auth
    )
  end

  def create_user_params
    params.require(:user).permit(
      :email,
      :tipos_usuarios_id
    )
  end

  def register_params
    login_params.merge(tipos_usuarios_id: 4)
  end
end
