require 'colorize'
#require 'will_paginate'
class Post
	attr_reader :title, :date, :text, :sponsored
	def initialize(title, date, text, sponsored)
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

class Blog
	def initialize
		@blog_array = []
	end	
	def add_post(post)
		@blog_array.push(post)
	end

	def create_front_page
		sorted_list = @blog_array.sort do |post1, post2|
			post2.date <=> post1.date
		end
		return sorted_list
	end

	def publish_front_page 
		@blog_array = create_front_page()
		@pages = 0
		for(var i=0; @blog_array.length; i++)
			@page = i/3
			@pages += 1
		end
		@p
		@blog_array.each do |post|
			if post.sponsored == 1
				puts "\n"
				puts post.date
				puts "*******#{post.title}*****"
				puts "**********"
				puts post.text
				puts "-----------"
				puts "\n\n"
			else
				puts "\n"
				puts post.date
				puts post.title
				puts "**********"
				puts post.text
				puts "-----------"
				puts "\n\n"
			end
		
		end
	end
end



blog = Blog.new

post1 = Post.new("Post title 1", "10/19/2015", "Post 1 text", 0)
blog.add_post(post1)

post2 = Post.new("Post title 2", "10/20/2015", "Post 2 text", 1)
blog.add_post(post2) 

 
post3 = Post.new("Post title 3", "10/21/2015", "Post 3 text", 0)
blog.add_post(post3)

post4 = Post.new("Post title 4", "10/22/2015", "Post 4 text", 0)
blog.add_post(post3)

post3 = Post.new("Post title 5", "10/23/2015", "Post 5 text", 0)
blog.add_post(post3)

post3 = Post.new("Post title 6", "10/24/2015", "Post 6 text", 0)
blog.add_post(post3)

post3 = Post.new("Post title 7", "10/25/2015", "Post 7 text", 0)
blog.add_post(post3)

post3 = Post.new("Post title 8", "10/26/2015", "Post 8 text", 0)
blog.add_post(post3)

blog.publish_front_page
