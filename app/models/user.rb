class User < ApplicationRecord
	has_many :posts

	before_save { self.email = email.downcase }

	validates :email, presence: true, length: { maximum: 256 }, uniqueness:
		{ case_sensitive: false }, format: { with: /.+@.+\.[A-Za-z0-9\-]+/ }
	validates :username, presence: true, length: { maximum: 20 }, uniqueness:
		{ case_sensitive: false }

	has_secure_password

	validates :password, length: { minimum: 6 }, allow_nil: true

	def to_param
		username
	end

	def User.digest(str)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(str, cost: cost)
	end

end
