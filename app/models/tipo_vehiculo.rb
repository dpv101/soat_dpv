class TipoVehiculo < ActiveRecord::Base
  belongs_to :clase_vehiculo
  has_many :vehiculos, dependent: :destroy
end
