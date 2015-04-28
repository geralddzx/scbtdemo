class Api::UsersController < ApplicationController
	load_and_authorize_resource

	def create
		user = User.new(user_params)
		set_role_param(user)
		user.set_username
		user.update_attributes(password_params)

		if user.save
			message = "User has been created, username is #{user.username}." 
			render success_message(message)
		else
			render error_message(user)
		end
	end

	def destroy
		@user.destroy
		render success_message("User Successfully Removed")
	end

	def update
		@user.update_attributes(user_params)
		set_role_param(@user)

		if @user.save
			render success_message("User has been Updated")
		else
			render error_message(@user)
		end
	end

	private
	def user_params
		params.require(:user).permit(
			:first_name, 
			:last_name,
			:email, 
			:number,
			:phone, 
			:street, 
			:city, 
			:postal_code, 
			:referral,
		)
	end

	def password_params
		params.require(:user).permit(:password, :password_confirmation)
	end

	def set_role_param(user)
		role_param = params[:user][:role].downcase
		roles = User::ROLES
		user.role = role_param if roles[0..1].include?(role_param) && current_user.admin?
		user.role = role_param if roles.include?(role_param) && current_user.master?
	end
end
