Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # Api usuarios
  delete 'users/:id', to: 'usuarios#delete_user'
  get 'users', to: 'usuarios#users_get'
  get 'users/:id', to: 'usuarios#user_get'
  post 'users/register', to: 'usuarios#register'
  post 'users/login', to: 'usuarios#login'
  post 'users/create', to: 'usuarios#create_user'
  post 'users/:id', to: 'usuarios#update_user'
  
end
