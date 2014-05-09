class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Using _csrf_token that saved in cookie to automatically add _authenticity_token in form. Then use _authenticity_token to realize function of CSRF
  protect_from_forgery with: :exception
end
