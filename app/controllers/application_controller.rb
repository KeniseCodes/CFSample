class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to main_app.root_url, :alert => exception.message
  end
  WillPaginate.per_page = 5
end
