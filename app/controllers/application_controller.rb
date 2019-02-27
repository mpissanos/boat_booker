class ApplicationController < ActionController::Base
  # before_action :set_time_zone, if: :user_signed_in?
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
end