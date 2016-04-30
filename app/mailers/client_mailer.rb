class ClientMailer < ApplicationMailer
  default to: 'thestudionathan@gmail.com'

  def enquiry(message)
    @message = message
    mail(from: message[:email], subject: 'Studio Nathan | Enquiry from ' + message[:name])
  end

  def reqAlbum(message)
    @message = message
    attachments["input.csv"] = {mime_type: 'text/csv', content: message[:files]}
    mail(from: message[:email], subject: 'Studio Nathan | Request for making Photo Album from ' + message[:name])
  end

  def autoreply(message)
    @message = message
    mail(from: 'thestudionathan@gmail.com' ,to: message[:email], subject: 'Studio Nathan | Thank you for your enquiry')
  end

  def albumAutoreply(message)
    @message = message
    mail(from: 'thestudionathan@gmail.com' ,to: message[:email], subject: 'Studio Nathan | Your request for Photo album is in progress')
  end

  #handle_asynchronously :welcome_email
end
