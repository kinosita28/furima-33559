class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX,allow_blank: true }

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :k_first
    validates :k_last
    validates :birthday
  end

  with_options format: { with: /\A[一-龥々]+\z/,allow_blank: true } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶ]+\z/,allow_blank: true } do
    validates :k_first
    validates :k_last
  end

  has_many :items
  has_many :orders
end
