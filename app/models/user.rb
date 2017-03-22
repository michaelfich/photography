class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable

  def password_required?
    false
  end

  class << self
    def from_five_hundred_pixels(params)
      user = find_by(provider: 'fiveHundredPx', uid: params['uid']) || create_from_five_hundred_pixels(params)
      user.update_attributes!(
        consumer_key: params['extra'].access_token.consumer.key,
        consumer_secret: params['extra'].access_token.consumer.secret,
        oauth_token: params['extra'].access_token.params[:oauth_token],
        oauth_token_secret: params['extra'].access_token.params[:oauth_token_secret]
      )
      user
    end

    def create_from_five_hundred_pixels(params)
      create! do |user|
        user.name = params['info']['name']
        user.email = params['info']['email']
        user.provider = 'fiveHundredPx'
        user.uid = params['uid']
      end
    end
  end
end
