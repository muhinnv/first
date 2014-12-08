class CommentsController < ApplicationController
	
	before_action :post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:show, :create]

	def create
		puts params
		comment = post.comments.new(comment_params)
		comment.user = current_user
		if comment.save
			flash[:notice] = "Comment was succesfully created"
		else
			flash[:notice] = "Comment wasn succesfully created"	
		redirect_to posts_path(post)
	end 

	private
		def post
			@post ||= Post.find( params[:post_id] )
		end

		def post_params
			params.require(:comment).permit(:title,:message)		
		end
		
		helper_method :post
end