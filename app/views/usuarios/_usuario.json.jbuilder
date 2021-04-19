json.extract! usuario, :id, :nome, :email, :acesso, :admin, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
