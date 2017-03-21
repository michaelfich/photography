class PhotosController < ApplicationController
  before_action :redirect_guests!

  BASE_API_ENDPOINT = 'https://api.500px.com/v1'.freeze

  def index
    params = {
      feature: 'highest_rated',
      rpp: '100',
      consumer_key: Figaro.env.five_hundred_pixels_consumer_key
    }
    response = RestClient.get("#{BASE_API_ENDPOINT}/photos", params: params)
    @photos = JSON.parse(response.body)['photos'].map { |photo| Photo.new(photo) }
  end

  private

  def redirect_guests!
    redirect_to root_path unless user_signed_in?
  end
end
