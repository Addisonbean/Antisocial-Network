class Post < ApplicationRecord
	belongs_to :user
	default_scope -> { order(created_at: :desc) }

	validates :text_content, length: { maximum: 256 }, presence: true
end
