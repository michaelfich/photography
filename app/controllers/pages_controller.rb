class PagesController < ApplicationController
  def home
    redirect_to photos_path if user_signed_in?
  end
end
