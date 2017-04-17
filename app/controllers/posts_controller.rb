class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :destroy]
	before_action :authorize, except: [:index, :show]
	def show
	end
	def index
		@posts = Post.all
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end
	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Successfully updated post"
			redirect_to post_path(@posts)
		else
			flash[:notice] = "error updating post"
			render :edit
		end
	end
	def destroy
		if @post.destroy
			flash[:notice] = "Post destroyed"
			redirect_to posts_path
		else
			flash[:notice] = "could not delete post"
		end
	end
	#
	private
	#
	def find_post
		@post = Post.find(params[:id])
	end
	def post_params
		params.require(:post).permit(:title,:body,:postType,:visible)
	end

end
