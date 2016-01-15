class ClientMailer < ApplicationMailer
  default to: 'scriperdj@gmail.com'

  def enquiry(message)
    @message = message
    mail(from: message[:email], subject: 'Enquiry from Studionathan')
  end

  #handle_asynchronously :welcome_email
end
