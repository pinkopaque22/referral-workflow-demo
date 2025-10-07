Rails.application.routes.draw do
  resources :referrals

  # Root path goes to referrals#index
  root "referrals#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
