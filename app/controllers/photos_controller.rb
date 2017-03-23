class PhotosController < ApplicationController
  before_action :redirect_guests!
  before_action :set_f00px_client!

  BASE_API_ENDPOINT = 'https://api.500px.com'.freeze

  def index
    photo_url = "#{BASE_API_ENDPOINT}/v1/photos"
    photo_query_params = {}
    photo_query_params[:feature] = 'popular'
    photo_query_params[:rpp] = '100'
    photo_query_params[:consumer_key] = Figaro.env.five_hundred_pixels_consumer_key
    response = @client.get(photo_url, photo_query_params)
    @photos = JSON.parse(response.body)['photos'].map { |photo| Photo.new(photo) }
  end

  def favorite
    vote_on_photo(params[:id], true)
  end

  def unfavorite
    vote_on_photo(params[:id], false)
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

  def vote_on_photo(id, favorite)
    api_endpoint = "#{BASE_API_ENDPOINT}/v1/photos/#{id}/vote"
    query_params = { vote: favorite.to_i }
    @client.post(api_endpoint, query_params)
  end
end
