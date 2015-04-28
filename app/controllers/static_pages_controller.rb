class StaticPagesController < ApplicationController
	def home
		@app = "scbt"
		@footer_path = "layouts/footer"
		render :home
	end

	def admin
		if current_user && current_user.admin?
			@header_path = "/static_pages/admin/header"
			@navbar_path = "/static_pages/admin/navbar"
			@app = "scbt-admin"
			render :admin
		else 
			flash[:alert] = "Only admins are allowed to access this page"
			redirect_to :root
		end
	end
end
