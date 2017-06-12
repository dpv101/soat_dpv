class Cliente < ActiveRecord::Base
  has_many :ventas, dependent: :destroy

  validates :nombres, presence: true
  validates :apellidos, presence: true
  validates :email, presence: true, uniqueness: true
  validates :tipo_documento, presence: true
  validates :numero_documento, presence: true, uniqueness: true

  def nombre_completo
    self.nombres + " " + self.apellidos
  end

end
