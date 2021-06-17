Rails.application.routes.draw do
  get 'admin/users_index'
  resources :usuarios
  get 'rules/new'
  get 'rules/create'
  root 'posts#index'

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {registrations: 'registrations'}

  # get '/users/:id', to: 'users#show'
  # /users/3 -> Users controller, show action, params {id: '3'}
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
    resources :bookmarks, only: [:create, :destroy], shallow: true
    resources :rules, only: [:create, :destroy], shallow: true
  end

  get '/admin/make_admin/:id', to: 'admin#make_admin'
  get '/admin/deny_access/:id', to: 'admin#deny_access'
  get '/admin/allow_access/:id', to: 'admin#allow_access'

  get '/rules', to: 'rules#index'
end
