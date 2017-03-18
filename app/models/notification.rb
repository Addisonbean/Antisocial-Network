class Notification < ApplicationRecord
	belongs_to :user

	scope :unviewed, -> { where(viewed: false).order(created_at: :desc) }

	def view
		self.viewed = true
		self.save
	end
end
