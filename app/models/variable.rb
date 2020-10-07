class Variable < ApplicationRecord
  belongs_to :base
  has_many :items, dependent: :destroy
  has_many :orders, through: :items

  include PgSearch::Model
  pg_search_scope :search,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
      }
end
