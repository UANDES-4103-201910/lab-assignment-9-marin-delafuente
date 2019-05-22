class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable,
				 :omniauthable, omniauth_providers: [:google_oauth2]
	has_many :user_tickets
	has_many :tickets, :through => :user_tickets

	validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, uniqueness: true

	validates :phone, length: {minimum: 9, maximum: 12}, allow_blank: true
	#validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,12}\z/ , message: "Password must be between 8 to 12 alphanumeric characters"}

		def self.from_omniauth(auth)
			where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
				user.email = auth.info.email
				user.password = Devise.friendly_token[0, 20]
				user.provider = auth.provider
				user.uid = auth.uid
				user.name = auth.info.name
				user.oauth_token = auth.credentials.token
				user.oauth_expieres_at = Time.at(auth.credentials.expires_at)
				user.save!
			end
		end

end
