Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :referrals

  # Root path goes to referrals#index
  root "referrals#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
