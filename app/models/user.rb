class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable

  def password_required?
    false
  end

  class << self
    def from_five_hundred_pixels(args)
      user = find_by(provider: 'fiveHundredPx', uid: args['uid']) || create_from_five_hundred_pixels(args)
      user.update_attributes!(
        consumer_key: args['extra'].access_token.consumer.key,
        consumer_secret: args['extra'].access_token.consumer.secret,
        oauth_token: args['extra'].access_token.params[:oauth_token],
        oauth_token_secret: args['extra'].access_token.params[:oauth_token_secret]
      )
      user
    end

    def create_from_five_hundred_pixels(args)
      create! do |user|
        user.name = args['info']['name']
        user.email = args['info']['email']
        user.provider = 'fiveHundredPx'
        user.uid = args['uid']
      end
    end
  end
end
