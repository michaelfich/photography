class SessionsController < ApplicationController
  def create
    user = User.from_five_hundred_pixels(env['omniauth.auth'])
    sign_in(:user, user)
    redirect_to root_path
  end

  def destroy
    sign_out(:user)
    redirect_to root_path
  end
end
