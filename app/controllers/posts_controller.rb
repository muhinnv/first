class PostsController < ApplicationController
	
	before_filter :post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end


	def show
	end

	def new
		@post = Post.new
	end

	def create
		puts params
		Post.create(post_params)
		#flash[:notice] = "post was succesfully created"
		flash[:warning] = "warning test"
		redirect_to posts_path, notice: "post was succesfully created!!!"
	end 

	def edit
	end

	def update
		@post.assign_attributes(post_params)
		if @post.save
			flash[:notice] = "post was succesfully updated"
		else
			flash[:notice] = "fail in updating post"
		end
		redirect_to post_path(@post)
	end

	def destroy
		@post.destroy
		flash[:notice] = "post was succesfully destroyed"
		redirect_to posts_path
	end

	private
		def post
			@post ||= Post.find( params[:id] )
		end

		def post_params
			params.require(:post).permit(:title,:body)		
		end
		
		helper_method :post
end