require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  describe 'GET /api/users/:id' do
    let(:user) { FactoryGirl.create(:user) }
    let(:id) { self.user.id }
    
    context 'with invalid id' do
      let(:id) { 'invalid_id' }
      it { is_expected.to eq 404 }
    end
    
    context 'with valid id' do
      it 'returns a user' do
        is_expected.to eq 200
        body = response.body
        expect(body).to be_json_eql(self.user.name.to_json).at_path('name')
      end
    end
  end
end
