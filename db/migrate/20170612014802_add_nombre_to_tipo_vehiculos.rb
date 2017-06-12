class AddNombreToTipoVehiculos < ActiveRecord::Migration
  def change
    add_column :tipo_vehiculos, :nombre, :string
  end
end
