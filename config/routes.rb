Rails.application.routes.draw do
  devise_for :users
  resources :photos, only: :index
  root to: 'pages#home'
end
