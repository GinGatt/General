class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
		render 'index'
	end
	def new
		render 'new'
	end
	def create
		# Create new Contact from params[:contact]
		contact = Contact.new(
			:name => params[:contact][:name],
			:address => params[:contact][:address],
			:phone_number => params[:contact][:phone],
			:email_address => params[:contact][:email])

		contact.save

		redirect_to("/contacts")
	end
end
