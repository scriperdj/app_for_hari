class ClientMailer < ApplicationMailer
  default to: 'thestudionathan@gmail.com'

  def enquiry(message)
    @message = message
    mail(from: message[:email], subject: 'Enquiry from Studionathan')
  end

  def autoreply(message)
    @message = message
    mail(from: 'thestudionathan@gmail.com' ,to: message[:email], subject: 'Studio Nathan | Thank you for your enquiry')
  end

  #handle_asynchronously :welcome_email
end
