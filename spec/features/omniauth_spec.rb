require 'rails_helper'

feature 'omniauth-500px' do
  before(:each) do
    oauth_params = {
      uid: 1,
      info: { name: 'Test User', email: 'test_user@example.com' }
    }
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new(oauth_params)
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:default]
  end

  after(:each) do
    OmniAuth.config.test_mode = false
  end

  scenario 'user can sign in and visit an authenticated route' do
    visit '/auth/500px'
    visit photos_url
    expect(page).to have_content('Photo Gallery')
    expect(page).to have_content('The top 100 rated photographs on 500px')
  end
end
