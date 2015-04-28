class Devise::SessionsController < ApplicationController
	def new
		@user = User.new
		render :new
	end

	def create
		user = User.find_by_username(params[:user][:username])
		if user && user.valid_password?(params[:user][:password])
			sign_in_and_redirect(:user, user)
		else
			@user = User.new({username: params[:user][:username]})
			flash.now[:alert] = "Username or password is incorrect"
			render :new
		end
	end

	def destroy
    	sign_out_and_redirect(:user)
  	end
end
