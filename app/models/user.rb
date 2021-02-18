class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
