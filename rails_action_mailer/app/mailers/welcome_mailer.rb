class WelcomeMailer < ApplicationMailer
  def notification
    mail(subject: 'rails action mailer notification mail')
  end
end
