json.extract! cliente, :id, :tipo_documento, :numero_documento, :nombres, :apellidos, :email, :telefono, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
