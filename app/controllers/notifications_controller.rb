class NotificationsController < ApplicationController

	def show
		# display error message here
		redirect_to root_path if !logged_in?

		#@notifications = current_user.notifications.viewed.map(&:view)
		@notifications = current_user.notifications
		respond_to do |format|
			format.js
		end
	end

end
