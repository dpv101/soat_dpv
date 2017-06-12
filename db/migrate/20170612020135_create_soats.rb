class CreateSoats < ActiveRecord::Migration
  def change
    create_table :soats do |t|
      t.integer :venta_id
      t.integer :vehiculo_id
      t.datetime :fecha_ini
      t.datetime :fecha_fin

      t.timestamps null: false
    end
  end
end
