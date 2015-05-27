require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  it 'should be able to sign in/sign out' do
    visit '/'
    expect(page).to have_content('logged_in: false')
    click_link 'Sign in'
    expect(page).to have_content('logged_in: true')
    click_link 'Sign out'
    expect(page).to have_content('logged_in: false')
  end
end
