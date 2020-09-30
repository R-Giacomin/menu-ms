class Base < ApplicationRecord
  belongs_to :user
  has_many :variables

  validates name, description, finality, data_base_sharing, data_base_name, presence: true
end
