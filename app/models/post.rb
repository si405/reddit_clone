class Post < ActiveRecord::Base
	has_many :comments

	# Create the search function that uses the input parameters
	# to create the search criteria. Search the post title and url
	def self.search(search)
  		search_condition = '%' + search + '%'
  		Post.joins(:comments).distinct. where("post_title LIKE '#{search_condition}' or
  		 	post_url LIKE '#{search_condition}' or
  		 	body LIKE '#{search_condition}'")
	end
end
