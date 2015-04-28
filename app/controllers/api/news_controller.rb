class Api::NewsController < ApplicationController
	load_and_authorize_resource

	def create
		news = News.new(news_params)
		news.author = current_user

		if news.save
			render success_message("News has been created")
		else
			render error_message(news)
		end
	end

	def destroy
		@news.destroy
		render success_message("News Successfully Removed")
	end

	def update
		@news.update_attributes(news_params)
		if @news.save
			render success_message("News has been Updated")
		else
			render error_message(@news)
		end
	end

	private
	def news_params
		params.require(:news).permit(:title, :datetime, :description, :content)
	end
end
