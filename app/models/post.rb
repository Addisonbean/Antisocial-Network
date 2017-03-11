class Post < ApplicationRecord
	belongs_to :user
	has_many :likes

	default_scope -> { order(created_at: :desc) }

	scope :not_from, ->(users) { where.not(user_id: users) }

	validates :text_content, length: { maximum: 256 }, presence: true
end
