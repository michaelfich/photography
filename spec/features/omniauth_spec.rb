# rubocop:disable Metrics/LineLength

require 'rails_helper'

feature 'omniauth-500px' do
  before(:each) do
    url = 'https://api.500px.com/v1/oauth/request_token'
    headers = {
      'Accept': '*/*',
      'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization': 'OAuth oauth_callback="http%3A%2F%2Fwww.example.com%2Fauth%2F500px%2Fcallback", oauth_consumer_key="fhUhe5sDtIqlZWrvgFeTf17d7WC64kVKXR77MBaJ", oauth_nonce="YOyTI5RgEp0kzHoYju4l2PyJ0CZZx2YefD2VhJrn5mg", oauth_signature="hmw2bAqzKN9jaELfJ3QxeRHZ7BM%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1490240803", oauth_version="1.0"',
      'Content-Length': '0',
      'Content-Type': 'application/x-www-form-urlencoded',
      'User-Agent': 'OAuth gem v0.5.1'
    }
    stub_request(:post, url).with(headers: headers).to_return(status: 200, body: '', headers: {})
  end

  pending 'user can sign in and visit an authenticated route' do
    visit '/auth/500px'
    visit photos_url
    expect(page).to have_content('Photo Gallery')
    expect(page).to have_content('The top 100 rated photographs on 500px')
  end
end
