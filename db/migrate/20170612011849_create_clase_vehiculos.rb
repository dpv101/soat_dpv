class CreateClaseVehiculos < ActiveRecord::Migration
  def change
    create_table :clase_vehiculos do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
