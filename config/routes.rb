Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Api usuarios
  delete 'users/delete/:id', to: 'usuarios#delete_user'
  get 'users', to: 'usuarios#users_get'
  get 'users/:id', to: 'usuarios#user_get'
  post 'users/register', to: 'usuarios#register'
  post 'users/login', to: 'usuarios#login'
  post 'users/admin/create', to: 'usuarios#create_user'
  post 'users/update/:id', to: 'usuarios#update_user'

  # Api ordenes
  delete 'ordenes/delete/:id', to: 'ordenes#delete'
  get 'ordenes', to: 'ordenes#all_orders_get'
  get 'ordenes/:id', to: 'ordenes#order_by_id_get'
  get 'ordenes/status/:status', to: 'ordenes#orders_by_status_get'
  post 'ordenes/create', to: 'ordenes#create'
  post 'ordenes/update/:id', to: 'ordenes#update'

  # Api estados ordenes
  get 'ordenes_estados', to: 'estados_ordenes#autorizar_accion_ordenes'

  # Api tipos de usuarios
  get 'tipos_usuarios', to: 'tipos_usuarios#all_tipos_usuarios'

  # Api tipos trabajo
  get 'tipos_trabajo', to: 'tipos_trabajos#all_tipos_trabajos'

  # Api productos
  get 'productos', to: 'productos#all_productos'
end
