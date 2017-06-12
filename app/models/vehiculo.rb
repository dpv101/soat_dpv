class Vehiculo < ActiveRecord::Base
  belongs_to :tipo_vehiculo
  belongs_to :clase_vehiculo
  has_many :ventas, dependent: :destroy
  has_many :soats, dependent: :destroy

  validates :edad, presence: true
  validates :placa, presence: true, uniqueness: true

  def get_dates_soat
    soats_active = self.soat_active
    if soats_active.count > 0
      date_ini = (soats_active[0].fecha_fin.to_datetime + 1.second)
    else
      date_ini = DateTime.now.strftime("%Y-%m-%d").to_datetime
    end
    date_fin = date_ini + 1.year - 1.second
    [date_ini, date_fin]
  end

  def soat_active
    self.soats.where("fecha_fin >=  '" + DateTime.now.strftime("%Y-%m-%d %H:%M:%S") + "'")
  end
end
