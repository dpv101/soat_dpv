class AddTotalToVentas < ActiveRecord::Migration
  def change
    add_column :ventas, :total, :decimal
  end
end
