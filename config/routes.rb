Rails.application.routes.draw do
  root to: 'pages#home'
  resources :photos, only: :index
end
