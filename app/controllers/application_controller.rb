class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter { session[:url] = request.path if controller_path != "sessions" }
  helper_method :current_user
  check_authorization
  rescue_from(CanCan::AccessDenied) { redirect_to "/auth/facebook" }

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
