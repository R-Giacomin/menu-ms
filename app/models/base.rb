class Base < ApplicationRecord
  belongs_to :user
  has_many :variables

  validates :name, :description, :legal_base, :user_id, :technical_area, presence: true
end
