class Order < ApplicationRecord
  enum category: { pessoais: 1, identificado: 2, nIdentificado: 3 }
  enum status: { aberta: 1, concluida: 2, cancelada: 3 }

  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :variables, through: :items

  validates :period, presence: true, on: :update
  validates :justify, presence: true, on: :update, if: :identificado?

  def base
    self.variables.first.base
  end

  def identificado?
    self.category == "identificado"
  end

end
