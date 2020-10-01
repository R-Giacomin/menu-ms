class Order < ApplicationRecord
  enum category: { pessoais: 1, gerais: 2 }
  enum status: { aberta: 1, concluida: 2, cancelada: 3 }

  belongs_to :user
  has_many :items, dependent: :destroy
end
