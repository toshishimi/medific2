Rails.application.routes.draw do
  devise_for :users
  root to: "medications#index"
  resources :medications, only: [:index, :new, :create]
end
