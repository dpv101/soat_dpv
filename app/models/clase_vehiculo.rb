class ClaseVehiculo < ActiveRecord::Base
  has_many :tipo_vehiculos, dependent: :destroy
  has_many :vehiculos, dependent: :destroy
end
