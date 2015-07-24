class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:ajoke]
  def home
    @title = "Home"
  end

  def packages
    @title = "Photography Packages"
  end

  def about
    @title = "About me"
  end

  def contact
    @title = "Contact me"
  end

  def ajoke
    if current_user.admin?
      @title = "Admin Page"
    else
      sign_out_and_redirect(current_user)
    end
  end
end
