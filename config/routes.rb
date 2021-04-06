Rails.application.routes.draw do
  get 'rules/new'
  get 'rules/create'
  root 'posts#index'

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

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
  get '/rules', to: 'rules#index'
end
