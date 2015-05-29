class ApplicationMailer < ActionMailer::Base
  default Settings.mailer.default.to_h
  layout 'mailer'
end
