class Base < ApplicationRecord
  belongs_to :user
  has_many :variables, dependent: :destroy

  validates :name, :description, :legal_base, :user_id, :technical_area, presence: true

  include PgSearch::Model
  pg_search_scope :search,
    against: [:name, :description],
    associated_against: {
      variables: [:name, :description]
    },
    using: {
      tsearch: { prefix: true }
    }
end
