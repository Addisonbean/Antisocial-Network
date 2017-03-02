class Post < ApplicationRecord
	belongs_to :user
	default_scope -> { order(created_at: :desc) }

	#scope :not_from, -> { where("WHERE user_id NOT IN (?)" }
	#scope :not_from(users), -> { where("WHERE user_id NOT IN (?)", users) }
	scope :not_from, ->(users) { where.not(user_id: users) }

	validates :text_content, length: { maximum: 256 }, presence: true
end
