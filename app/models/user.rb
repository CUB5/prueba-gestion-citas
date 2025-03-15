class User < ApplicationRecord
  # enum role: { cliente: 0, medico: 1, admin: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { cliente: 0, medico: 1, admin: 2}
  
  has_one :cliente, dependent: :destroy

  after_initialize :set_default_role, :if => :new_record?
  after_create :asociar_cliente

  def set_default_role
    self.role ||= 0
  end

  private

  def asociar_cliente
    return unless cliente.nil? # Para evitar crear más de un cliente por usuario
    Cliente.create!(user_id: self.id, codigo: "C#{id.to_s.rjust(3, '0')}")
  end

end
