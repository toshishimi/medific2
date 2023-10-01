Rails.application.routes.draw do
  get 'date_hospitals/index'
  devise_for :users
  root to: "date_hospitals#index"
  resources :date_hospitals, only: [:new, :create]
end
