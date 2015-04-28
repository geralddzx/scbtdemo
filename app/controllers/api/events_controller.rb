class Api::EventsController < ApplicationController
	load_and_authorize_resource

	def create
		event = Event.new(event_params)
		event.author = current_user

		if event.save
			render success_message("Event has been created")
		else
			render error_message(event)
		end
	end

	def destroy
		@event.destroy
		render success_message("Event Successfully Removed")
	end

	def update
		@event.update_attributes(event_params)

		if @event.save
			render success_message("Event has been Updated")
		else
			render error_message(@event)
		end
	end

	private
	def event_params
		params.require(:event).permit(:title, :datetime, :location, :content, :display)
	end
end
