class LikesController < ApplicationController

	def create
		#like = Like.new(like_params)
		@post = Post.find(params[:like][:post_id])
		if @post.likes.find_by(user_id: current_user.id)
			# fix/handle properly
			return
		end
		like = @post.likes.build
		like.user_id = current_user.id
		if like.save
			@post.user.notify(like.message_from(current_user))
			respond_to do |format|
				format.js
			end
		else
			puts "wwhhhyyyyyy"
		end
	end

	private

	def like_params
		params.require(:like).permit(:post_id)
	end

end
