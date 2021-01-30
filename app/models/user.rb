class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :k_first, presence: true
  validates :k_last, presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :orders
end
