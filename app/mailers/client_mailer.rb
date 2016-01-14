class ClientMailer < ApplicationMailer
  default from: 'admin@haristudio.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  #handle_asynchronously :welcome_email
end
