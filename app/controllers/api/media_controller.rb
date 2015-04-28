class Api::MediaController < ApplicationController
	load_and_authorize_resource
	def create
		media_errors = []
		media_params.each do |medium_params|
			medium = Medium.new(medium_params)
			medium.uploader = current_user
			unless medium.save
				media_errors.push(error_text(medium))
			end
		end

		if media_errors.empty?
			render success_message("Media has been saved") 
		else
			render error_message(media_errors.join("\n"))
		end
	end

	def destroy
		@medium.destroy
		render success_message("File Successfully Removed")
	end

	# def slider
	# 	@medium = Medium.find(params[:medium_id])
	# 	@medium.slider = params[:setting]
	# 	if @medium.save
	# 		render success_message("Setting has been updated")
	# 	else
	# 		render error_message(@medium)
	# 	end
	# end

	private
	def media_params
		media = params[:media] || [params[:medium]] || []
		media.map do |medium|
			medium.permit(:size, :url, :mimetype, :filename, :source_id, :source_type)
		end
	end
end
