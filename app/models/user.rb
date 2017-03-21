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
      find_by(provider: '500px', uid: params['uid']) || create_from_five_hundred_pixels(params)
    end

    def create_from_five_hundred_pixels(params)
      create! do |user|
        user.name = params['info']['name']
        user.email = params['info']['email']
        user.provider = '500px'
        user.uid = params['uid']
      end
    end
  end
end
