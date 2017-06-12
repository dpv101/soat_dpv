class Venta < ActiveRecord::Base
  self.table_name = "ventas"
  belongs_to :cliente
  belongs_to :vehiculo

  has_many :soat, dependent: :destroy

end
