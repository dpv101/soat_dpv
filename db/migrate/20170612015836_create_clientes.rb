class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :tipo_documento
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.string :email
      t.string :telefono

      t.timestamps null: false
    end
    add_index :clientes, :numero_documento, unique: true
    add_index :clientes, :email, unique: true
  end
end
