class PostsController < ApplicationController

  before_action :post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :create, :destroy, :new]

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
    current_user.posts.create(post_params)
    redirect_to posts_path, notice: "Post was successflly created"
  end	

  def edit
  end

  def update
    @post.assign_attributes(post_params)
    if @post.save 
      flash[:notice] = "Post was successflly updated"
    else
      flash[:notice] = "Failing updatin post"
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    flash[:notice]="Post was succesfully deleted"
    redirect_to posts_path
  end  

  private
    def post
      @post ||= Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :body)
    end

  helper_method :post
end
