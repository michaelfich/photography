class PhotosController < ApplicationController
  before_action :redirect_guests!
  before_action :set_f00px_client!

  BASE_API_ENDPOINT = 'https://api.500px.com'.freeze

  def index
    photo_api_endpoint = "#{BASE_API_ENDPOINT}/v1/photos"
    photo_query_params = {
      feature: 'popular',
      rpp: '100',
      consumer_key: Figaro.env.five_hundred_pixels_consumer_key
    }
    response = RestClient.get(photo_api_endpoint, params: photo_query_params)
    @photos = JSON.parse(response.body)['photos'].map { |photo| Photo.new(photo) }
  end

  def favorite
    @client.post("photos/#{params[:id]}/vote", vote: 1)
  rescue RestClient::Unauthorized => e
    logger.error e.message
  end

  def unfavorite
    @client.post("photos/#{params[:id]}/vote", vote: 0)
  rescue RestClient::Unauthorized => e
    logger.error e.message
  end

  private

  def redirect_guests!
    redirect_to root_path unless user_signed_in?
  end

  def set_f00px_client!
    @client = F00px::Client.new
    @client.token = current_user.oauth_token
    @client.token_secret = current_user.oauth_token_secret
  end
end
