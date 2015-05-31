require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'POST #send_mail' do
    after { ActionMailer::Base.deliveries.clear }
    
    it 'should deliver WelcomeMailer#notification mail' do
      expect { post :send_mail }.to change { ActionMailer::Base.deliveries.count }.by 1
    end
  end
end
