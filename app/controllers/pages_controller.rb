class PagesController < ApplicationController
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
end
