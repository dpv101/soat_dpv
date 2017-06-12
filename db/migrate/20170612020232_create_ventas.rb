class CreateVentas < ActiveRecord::Migration
  def change
    create_table :ventas do |t|
      t.integer :cliente_id
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
