class CreateVehiculos < ActiveRecord::Migration
  def change
    create_table :vehiculos do |t|
      t.string :placa
      t.decimal :edad
      t.integer :tipo_vehiculo_id

      t.timestamps null: false
    end
    add_index :vehiculos, :placa, unique: true
  end
end
