class User < ApplicationRecord

	has_secure_password

	def to_param
		username
	end
end
