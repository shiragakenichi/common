Rails.application.routes.draw do
  devise_for :users
  root to: 'subjects#index'
  resources :subjects, only: [:index, :edit, :update]
end
