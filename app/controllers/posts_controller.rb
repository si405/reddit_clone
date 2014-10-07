class PostsController < ApplicationController

	# Instantiate a new empty post object
	def new
		@post = Post.new
	end

	# Create a new post using the params provided from 
	# the view and redirect back to the main index page
	def create
		# binding.pry
		@post = Post.create(post_params)
		redirect_to @post
	end
	
	# Set @posts to contain all the saved posts
	def index
		@posts = Post.all.order(:created_at)
	end

	# Params contains the data being passed back from the view
	def edit
		binding.pry
		@post = Post.find(params[:id])
	end

	# Update the modified post and redirect back to main index
	# Due to the lack of state we first need to relocate the 
	# selected post and then perform the update
	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		# I tried putting redirect_to @posts but it came up with an error so 
		# need to look in to why that happened. Using @post/show instead
		redirect_to @post
	end

	# Show all saved posts
	def show
		@posts = Post.all.order(:created_at)
	end

	private
  		def post_params
  		  params.require(:post).permit(:post_title, :post_url)
 		end

end
