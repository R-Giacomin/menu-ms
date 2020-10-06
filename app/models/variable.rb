class Variable < ApplicationRecord

  belongs_to :base
  has_many :items, dependent: :destroy
  has_many :orders, through: :items
end
