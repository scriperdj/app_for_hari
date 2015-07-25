class AjokeController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_check

  def options
    @title = "Options"
  end

  def gallaries
    @title = "Gallaries"
  end

  def clients
    @title = "Clients"
  end

  def schedule
    @title = "Schedule"
  end

  def notifications
    @title = "Nitifications"
  end

  def profile
    @title = "Profile"
  end

  private

    def admin_check
      unless current_user.admin? 
        sign_out_and_redirect(current_user)
      end
    end
end
