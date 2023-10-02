Rails.application.routes.draw do
  devise_for :users
  root to: "date_hospitals#index"
  resources :date_hospitals, only: [:index, :new, :create, :destroy] do
    resources :medications, only: [:show, :edit, :update]
  end
end
