class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :occation
  attribute :date
  attribute :comments

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "thestudionathan@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
