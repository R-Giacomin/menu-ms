class Variable < ApplicationRecord
  belongs_to :base
  has_many :items
end
