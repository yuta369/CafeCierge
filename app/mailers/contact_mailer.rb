class ContactMailer < ApplicationMailer
  default from: 'no-reply@cafecierge.com'

  def send_mail(contact)
    @contact = contact
    mail(to: 'your-email@example.com', subject: 'お問い合わせがありました')
  end
end
