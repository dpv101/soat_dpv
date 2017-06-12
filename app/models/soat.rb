class Soat < ActiveRecord::Base
  belongs_to :venta
  belongs_to :vehiculo

  validates :vehiculo_id, presence:true

end
