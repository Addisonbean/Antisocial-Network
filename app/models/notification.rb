class Notification < ApplicationRecord
	belongs_to :user

	scope :unviewed, -> { where viewed: false }

	def view
		viewed = true
	end
end
