class PhotosController < ApplicationController
  before_action :redirect_guests!

  BASE_API_ENDPOINT = 'https://api.500px.com'.freeze

  def index
    photo_api_endpoint = "#{BASE_API_ENDPOINT}/v1/photos"
    photo_query_params = {
      feature: 'highest_rated',
      rpp: '100',
      consumer_key: Figaro.env.five_hundred_pixels_consumer_key
    }
    response = RestClient.get(photo_api_endpoint, params: photo_query_params)
    @photos = JSON.parse(response.body)['photos'].map { |photo| Photo.new(photo) }
  end

  def favorite
    photo_api_endpoint = "#{BASE_API_ENDPOINT}/v1/photos/#{params[:id]}/vote"
    photo_query_params = { vote: 1 }
    consumer_options = {
      signature_method: 'HMAC-SHA1',
      request_token_path: '/v1/oauth/request_token',
      authorize_path: '/v1/oauth/authorize',
      access_token_path: '/v1/oauth/access_token',
      proxy: nil,
      scheme: :header,
      http_method: :post,
      oauth_version: '1.0',
      site: 'https://api.500px.com'
    }
    consumer = OAuth::Consumer.new current_user.consumer_key, current_user.consumer_secret, consumer_options
    access_token = OAuth::AccessToken.new(consumer, current_user.oauth_token, current_user.oauth_token_secret)
    RestClient.add_before_execution_proc do |req, _|
      access_token.sign! req
    end
    RestClient.post(photo_api_endpoint, params: photo_query_params)
  rescue RestClient::Unauthorized => e
    logger.error e.message
  end

  private

  def redirect_guests!
    redirect_to root_path unless user_signed_in?
  end
end
