Rails.application.routes.draw do
  devise_for :users
  get 'medications/index'
  root to: "medications#index"
end
