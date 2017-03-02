class UnfollowsController < ApplicationController

	def unfollow
		user = User.find_by(username: params[:username])
		@success = false
		if user
			current_user.unfollow(user)
			@success = true
		else
			# handle error
		end
		respond_to do |format|
			format.js
		end
	end

end
