class NotificationsController < ApplicationController

	def show
		# display error message here
		redirect_to root_path if !logged_in?

		@notifications = current_user.notifications.unviewed.each(&:view)
		respond_to do |format|
			format.js
		end
	end

end
