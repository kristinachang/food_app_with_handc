class EntriesController < ApplicationController
	before_action :authenticate_user!

	def index
		# GET /users/:user_id/entries  user_entries
	end

	def new
		# GET /users/:user_id/entries/new  new_user_entry
	end

	def create
		# POST /users/:user_id/entries
	end

	def show
		# GET /users/:user_id/entries/:id  user_entry
	end

	def edit
		# GET /users/:user_id/entries/:id/edit  edit_user_entry
	end

	def update
		# PUT /users/:user_id/entries/:id
	end

	def destroy
		# DELETE /users/:user_id/entries/:id  
	end

end
