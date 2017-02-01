class StaticPagesController < ApplicationController
	def home
		if logged_in?
			@feed_items = current_user.posts
			@post = current_user.posts.build
		end
	end
end
