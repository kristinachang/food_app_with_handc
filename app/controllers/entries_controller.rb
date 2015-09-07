class EntriesController < ApplicationController
	before_action :authenticate_user!

	def index
		# GET /users/:user_id/entries  user_entries
		@user = current_user
		@entries = Entry.all
	end

	def new
		# GET /users/:user_id/entries/new  new_user_entry
		@user = current_user
		@entry = Entry.new
	end

	def create
		# POST /users/:user_id/entries
		@user = current_user
		@entry = @user.entries.new(:date)

		if @entry.save
			redirect_to user_entries_path @user
		else
			render :new 
		end
	end

	def show
		# GET /users/:user_id/entries/:id  user_entry
		@user = current_user
    	#@entry = Entry.find(params[:id])
    	@entry = Entry.new

    	@food_morning = []
		@food_midday =[]
		@food_evening = []

		#current_user.entries.each do |entry|


		# USDA API
		if params[:q]
			search = params[:q]
			if search
				resp = Typhoeus.get(
					"http://api.nal.usda.gov/usda/ndb/search",
					params: {
					format: "json",
					q: search,
					sort: "n",
					max: 30,
					offset: 0,
					api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
					}
				)
				@foods = JSON.parse(resp.body)["list"]["item"]
			else 
				@foods = []
			end
    	end 

    	if params[:ndbno].present?
			resp = Typhoeus.get(
				"http://api.nal.usda.gov/usda/ndb/reports",
				params: {
				format: "json",
				ndbno: params[:ndbno],
				type: "b",
				api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
				}
			)
			@food = JSON.parse(resp.body)["report"]	

			@entry.name = @food["food"]["name"]
			#@entry.date = :date
			#@entry.time = :time
			@entry.ndbno = params[:ndbno]
			@entry.kcal = @food["food"]["nutrients"][1]["measures"][0]["value"]
			@entry.protein = @food["food"]["nutrients"][2]["measures"][0]["value"]
			@entry.fat = @food["food"]["nutrients"][3]["measures"][0]["value"]
			@entry.carb = @food["food"]["nutrients"][4]["measures"][0]["value"]

			@entry.save
			@food_morning << {'name': entry.name, 'kcal': entry.kcal}

			redirect_to user_entry_path
		end

		# unless params[:ndbno].present?
		# 	if @entry.update(entry_params)
		# 		redirect_to user_entries_path(current_user)
		# 	else
		# 		render :edit
		# 	end
		# end

	end

	def edit
		# GET /users/:user_id/entries/:id/edit  edit_user_entry
		@entry = Entry.find(params[:id])
	end

	def update
		# PUT /users/:user_id/entries/:id
		@user = current_user
		#@entry = Entry.find(params[:id])
		@entry = Entry.new

		@food_morning = []
		@food_midday =[]
		@food_evening = []


		if params[:ndbno].present?
			resp = Typhoeus.get(
				"http://api.nal.usda.gov/usda/ndb/reports",
				params: {
				format: "json",
				ndbno: params[:ndbno],
				type: "b",
				api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
				}
			)
			@food = JSON.parse(resp.body)["report"]

			@entry.name = @food["food"]["name"]
			#@entry.date = :date
			#@entry.time = :time
			@entry.ndbno = params[:ndbno]
			@entry.kcal = @food["food"]["nutrients"][1]["measures"][0]["value"]
			@entry.protein = @food["food"]["nutrients"][2]["measures"][0]["value"]
			@entry.fat = @food["food"]["nutrients"][3]["measures"][0]["value"]
			@entry.carb = @food["food"]["nutrients"][4]["measures"][0]["value"]

			#binding.pry

			@entry.save!
			@food_morning << {'name': @entry.name, 'kcal': @entry.kcal}

			redirect_to user_entry_path
		end

		# unless params[:ndbno].present?
		# 	if @entry.update(entry_params)
		# 		redirect_to user_entries_path(current_user)
		# 	else
		# 		render :edit
		# 	end
		# end
	end

	def destroy
		# DELETE /users/:user_id/entries/:id  
		@entry = Entry.find(params[:id])
		@entry.destroy

		redirect_to user_entries_path(current_user)
	end

	private
		def entry_params
			#params.require(:entry).permit(:name, :date, :time, :ndbno, :kcal, :protein, :fat, :carb, :unit, :servings)
			#params.require(:entry).permit(:date)
		end

end
