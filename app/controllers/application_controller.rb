class ApplicationController < ActionController::API
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

 ## Skip sessions and cookies for Rails API
#  def skip_session
#     request.session_options[:skip] = true
#  end

end