class AddClaseVehiculoToVehiculo < ActiveRecord::Migration
  def change
    add_column :vehiculos, :clase_vehiculo_id, :integer
  end
end
