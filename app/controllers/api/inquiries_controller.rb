class Api::InquiriesController < ApplicationController
	load_and_authorize_resource
	
	def create
		inquiry = Inquiry.new(inquiry_params)
		inquiry.http_user_agent = request.env["HTTP_USER_AGENT"]
		inquiry.ip_address = request.remote_ip

		if inquiry.save
			render success_message("Inquiry has been submitted, our staff will get back to you as soon as possible.")
		else
			render error_message(inquiry)
		end
	end

	def mark_read
		@inquiry = Inquiry.find(params[:inquiry_id])
		@inquiry.read = true
		@inquiry.save
		render success_message("Inquiry has been marked as read")
	end

	private
	def inquiry_params
		params.require(:inquiry).permit(:email, :phone, :subject, :name)
	end
end
