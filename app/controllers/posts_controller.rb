class PostsController < ApplicationController

	before_action :post

	def index
		@posts = Post.all
	end

	def show
		
	end

	private
		def post
			@post ||= Post.find(params[:id])
		end

		helper_method :post
end
