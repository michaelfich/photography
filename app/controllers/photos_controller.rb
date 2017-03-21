class PhotosController < ApplicationController
  before_action :redirect_guests!

  BASE_API_ENDPOINT = 'https://api.500px.com/v1'.freeze

  def index
    photo_api_endpoint = "#{BASE_API_ENDPOINT}/photos"
    photo_query_params = {
      feature: 'highest_rated',
      rpp: '100',
      consumer_key: Figaro.env.five_hundred_pixels_consumer_key
    }
    response = RestClient.get(photo_api_endpoint, params: photo_query_params)
    @photos = JSON.parse(response.body)['photos'].map { |photo| Photo.new(photo) }
  end

  def favorite
    photo_api_endpoint = "#{BASE_API_ENDPOINT}/photos/#{params[:id]}/favorite"
    photo_query_params = { consumer_key: Figaro.env.five_hundred_pixels_consumer_key }
    RestClient.post(photo_api_endpoint, params: photo_query_params)
  rescue RestClient::Unauthorized => e
    logger.error e.message
  end

  private

  def redirect_guests!
    redirect_to root_path unless user_signed_in?
  end
end
