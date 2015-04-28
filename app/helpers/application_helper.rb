module ApplicationHelper
	def devise_error_messages
		if defined?(resource)
			resource.errors.full_messages
		else
			[]
		end
	end

	def reset_password_token
		params[:reset_password_token] || params[:user] && params[:user][:reset_password_token]
	end

	def error_text(model)
		model.errors.full_messages.join(", ")
	end

	def error_message(subject)
		if subject.is_a? String
			message = subject
		else
			message = error_text(subject)
		end
		{json: {message: message}, status: 412}
	end

	def success_message(message)
		{json: {message: message}}
	end
end
