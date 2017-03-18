class Like < ApplicationRecord
	include Rails.application.routes.url_helpers

	belongs_to :user
	belongs_to :post

	def message_from(user)
		"<a href='#{user_path(user)}'>@#{CGI::escapeHTML user.username}</a> liked your post!".html_safe
	end
end
