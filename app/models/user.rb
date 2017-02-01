class User < ApplicationRecord
	has_many :posts

	validates :email, presence: true, length: { maximum: 256 }, uniqueness:
		{ case_sensitive: false }, format: { with: /.+@.+/ }
	validates :username, presence: true, length: { maximum: 20 }, uniqueness:
		{ case_sensitive: false }

	has_secure_password

	def to_param
		username
	end
end
