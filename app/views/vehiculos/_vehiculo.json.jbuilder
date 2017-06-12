json.extract! vehiculo, :id, :placa, :edad, :numero_pasajeros, :cilindraje, :peso, :created_at, :updated_at
json.url vehiculo_url(vehiculo, format: :json)
