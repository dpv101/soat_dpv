json.extract! tipo_vehiculo, :id, :clase_vehiculo_id, :codigo, :edad, :tasa_comercial, :valor_prima, :contribucion_fosyga, :subtotal, :tasa_run, :total_pagar, :created_at, :updated_at
json.url tipo_vehiculo_url(tipo_vehiculo, format: :json)
