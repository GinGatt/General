require 'colorize'


class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
end

class Sponsored < Post

end 

class Blog
	def initialize
		@blog_array = []
	end	

	def add_post(post)
		@blog_array.push(post)
	end

	def create_front_page(array)
		sorted_list = array.sort do |post1, post2|
			post2.date <=> post1.date
		end
		sorted_list
	end

	def format_posts(array)
		array.each do |post|
			if post.class.name == "Sponsored"
				puts "\n"
				puts post.date
				puts "sponsored post"
				puts "*******#{post.title}*****"
				puts "**********"
				puts post.text
				puts "-----------"
				puts "\n"
			else 
				puts "\n"
				puts post.date
				puts post.title
				puts "**********"
				puts post.text
				puts "-----------"
				puts "\n"
			end
		end 
	end 

	def print_page(pages, page)
		count = 1
		while count < pages + 2
			if count != page
				print "#{count}\s\s"
			else 
				print "#{page.to_s.colorize(:light_blue).underline}\s\s"
			end 
			count +=1
		end 
		puts "\n"
	end

	def get_posts(page, array)
		beg_range = page*3-3
		array[beg_range..beg_range+2]
	end 

	def publish_front_page 
		sorted_array = create_front_page(@blog_array)
		num_pages = (sorted_array.length/3).ceil
		page = 1
		
		puts "Yay! My first Console Blog"
		puts "Use 'next' to go to the next page; use 'prev' to go to the previous page; use 'exit' to leave blog."
		posts_at_bat = get_posts(page, sorted_array)
		format_posts(posts_at_bat)
		
		print_page(num_pages, page)
		
		input = gets.chomp

		while input != "exit"
			if input.downcase == "next"
				page = page + 1
			elsif input.downcase == "prev"
				page = page - 1
			else 
				puts "\nNot a recognized command *frowns*"

			end
			posts_at_bat = get_posts(page, sorted_array)
			format_posts(posts_at_bat)
			print_page(num_pages, page)
			input = gets.chomp
		end 
	end 
end



blog = Blog.new

post1 = Post.new("Post title 1", "10/19/2015", "Post 1 text")
blog.add_post(post1)

post2 = Post.new("Post title 2", "10/20/2015", "Post 2 text")
blog.add_post(post2) 

 
post3 = Sponsored.new("Post title 3", "10/21/2015", "Post 3 text")
blog.add_post(post3)

post4 = Post.new("Post title 4", "10/22/2015", "Post 4 text")
blog.add_post(post4)

post5 = Sponsored.new("Post title 5", "10/23/2015", "Post 5 text")
blog.add_post(post5)

post6 = Post.new("Post title 6", "10/24/2015", "Post 6 text")
blog.add_post(post6)

post7 = Post.new("Post title 7", "10/25/2015", "Post 7 text")
blog.add_post(post7)

post8 = Post.new("Post title 8", "10/26/2015", "Post 8 text")
blog.add_post(post8)


blog.publish_front_page
