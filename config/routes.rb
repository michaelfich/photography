Rails.application.routes.draw do
  resources :photos, only: :index do
    member do
      patch :favorite
      patch :unfavorite
    end
  end

  get '/auth/500px/callback', to: 'sessions#create'
  devise_for :users, path: '', skip: [:session, :password, :registration, :confirmation]
  devise_scope :user do
    delete 'logout', to: 'sessions#destroy'
  end
  root to: 'pages#home'
end
