class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    include ApplicationHelper
    protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
    	render json: {message: "Access Denied, Make Sure You Are Signed In"}, status: :unauthorized
    end
end
