class User < ApplicationRecord
	has_many :posts
	has_many :notifications

	has_many :likes

	has_many :active_unfollowings, class_name: "Unfollow",
	         foreign_key: "unfollower_id",
			 dependent: :destroy

	has_many :passive_unfollowings, class_name: "Unfollow",
	         foreign_key: "unfollowed_id",
			 dependent: :destroy

	has_many :unfollowing, through: :active_unfollowings, source: :unfollowed
	has_many :unfollowers, through: :passive_unfollowings, source: :unfollower

	before_save { self.email = email.downcase }

	validates :email, presence: true, length: { maximum: 256 }, uniqueness:
		{ case_sensitive: false }, format: { with: /.+@.+\.[A-Za-z0-9\-]+/ }
	validates :username, presence: true, length: { maximum: 20 }, uniqueness:
		{ case_sensitive: false }

	has_secure_password

	validates :password, length: { minimum: 6 }, allow_nil: true

	validates :bio, length: { maximum: 256 }

	def unfollow(other)
		unfollowing << other
	end

	def following?(other)
		!unfollowing.include?(other)
	end

	def to_param
		username
	end

	def User.digest(str)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(str, cost: cost)
	end

	def notify(msg)
		n = notifications.build
		n.text_content = msg
		n.viewed = false
		n.save
		# update if their logged in?
	end

end
