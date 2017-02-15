class StaticPagesController < ApplicationController
	def home
		if logged_in?
			#@feed_items = current_user.posts
			@feed_items = Post.all
			@post = current_user.posts.build
		end
	end
end
