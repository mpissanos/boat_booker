class ApplicationController < ActionController::Base
  # before_action :set_time_zone, if: :user_signed_in?

  def parse_date(date)
    date.strftime("%m/%d/%Y")
  end

  private

    def set_time_zone
      Time.zone = current_user.time_zone
    end
end
