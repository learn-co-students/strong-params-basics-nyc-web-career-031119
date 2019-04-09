class PostsController < ApplicationController
	before_action :get_post, only: [:show, :update, :edit]
	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@p = Post.new
	end

	def create
	  @post = Post.new(params.require(:post).permit(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @p.update(params.require(:post).permit(:title))
	  redirect_to post_path(@p)
	end

	def edit
	end

	private

	def get_post
		@p = Post.find(params[:id])
	end

end
