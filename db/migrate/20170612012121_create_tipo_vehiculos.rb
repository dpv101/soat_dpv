class CreateTipoVehiculos < ActiveRecord::Migration
  def change
    create_table :tipo_vehiculos do |t|
      t.integer :clase_vehiculo_id
      t.string :codigo
      t.string :edad
      t.decimal :tasa_comercial
      t.decimal :valor_prima
      t.decimal :contribucion_fosyga
      t.decimal :subtotal
      t.decimal :tasa_run
      t.decimal :total_pagar

      t.timestamps null: false
    end
  end
end
