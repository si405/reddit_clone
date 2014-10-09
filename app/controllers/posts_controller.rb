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
		@post.post_count = 0
		redirect_to posts_path 
	end
	
	# Set @posts to contain all the saved posts in descending vote
	# count order
	def index
		@posts = Post.all.order(post_count: :desc)
	end

	# Params contains the data being passed back from the view
	def edit
		@post = Post.find(params[:id])
	end

	# Update the modified post and redirect back to main index
	# Due to the lack of state we first need to relocate the 
	# selected post and then perform the update
	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to posts_path
	end

	# Show all saved posts
	def show
		@post = Post.find(params[:id])
	end

	# Delete the seleected post and redirect back to the 
	# list of posts
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	# Increment the post vote count

	def upvote
		@post = Post.find(params[:id])
		new_count = @post.post_count += 1
		@post.update_attributes(:post_count => new_count)
		redirect_to posts_path
	end

	# Decrement the post vote count

	def downvote
		@post = Post.find(params[:id])
		new_count = @post.post_count = @post.post_count - 1
		@post.update_attributes(:post_count => new_count)
		redirect_to posts_path
	end

	private
  		def post_params
  		  params.require(:post).permit(:post_title, :post_url, :post_count)
 		end

end
