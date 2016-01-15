class ClientMailer < ApplicationMailer
  default to: 'thestudionathan@gmail.com'

  def enquiry(message)
    @message = message
    mail(from: message[:email], subject: 'Enquiry from Studionathan')
  end

  #handle_asynchronously :welcome_email
end
