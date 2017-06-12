class AddVehiculoIdToVentas < ActiveRecord::Migration
  def change
    add_column :ventas, :vehiculo_id, :integer
  end
end
