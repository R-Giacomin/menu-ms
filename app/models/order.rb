class Order < ApplicationRecord
  enum category: { pessoais: 1, identificados: 2, n_identificados: 3 }
  enum status: { aberta: 1, concluida: 2, cancelada: 3 }

  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :variables, through: :items

  def base
    self.variables.first.base
  end
end
