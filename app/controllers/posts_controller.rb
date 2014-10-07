class PostsController < ApplicationController

	# Instantiate a new empty post object
	def new
		@post = Post.new
	end

	# Create a new post using the params provided from 
	# the view
	def create
		binding.pry
		@post = Post.create(post_params)
		redirect_to @posts
	end
	
	def index
		@posts = Post.all
	end

	private
  		def post_params
  		  params.require(:post).permit(:post_title, :post_url)
 		end

end
