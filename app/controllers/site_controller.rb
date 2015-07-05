class SiteController < ApplicationController

	def index
		@users= current_user
		# GET /  root
	end

	def about
		# GET /about  about
	end

	def contact
		# GET /contact  contact
	end

end
