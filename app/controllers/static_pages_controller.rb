class StaticPagesController < ApplicationController

	POSTS_PER_PAGE = 20

	def home
		if logged_in?
			@post = current_user.posts.build
			@page = 1
			@feed_items = Post.not_from(current_user.unfollowing).page(@page).per(POSTS_PER_PAGE)
		end
	end

	def page
		@page = params[:page].to_i
		@feed_items = Post.not_from(current_user.unfollowing).page(@page).per(POSTS_PER_PAGE)
		respond_to do |format|
			format.js
		end
	end
end
