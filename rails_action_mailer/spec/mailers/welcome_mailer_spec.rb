require "rails_helper"

RSpec.describe WelcomeMailer, type: :mailer do
  describe '::notification()' do
    let(:mail){ WelcomeMailer.notification }
    
    it 'should set Subject:' do
      expect(self.mail.subject).to eq 'rails action mailer notification mail'
    end
    
    it 'should set To:' do
      expect(self.mail.to).to eq [Settings.mailer.default.to]
    end
    
    it 'should set From:' do
      expect(self.mail.from).to eq [Settings.mailer.default.from]
    end
  end
end
