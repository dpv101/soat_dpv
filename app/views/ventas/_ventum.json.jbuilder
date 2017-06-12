json.extract! venta, :id, :cliente_id, :usuario_id, :created_at, :updated_at
json.url venta_url(venta, format: :json)
