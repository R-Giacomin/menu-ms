class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bases, class_name: 'Base' # rails admin pluralizou errado e nao achou a classe
  has_many :orders, dependent: :destroy

  has_one_attached :photo
end
