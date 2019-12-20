Rails.application.routes.draw do
  devise_for :user
  root to: 'messages#index'
  resources :users, only: [:index]
  resources :subjects, only: [:index, :edit, :update]
  resources :messages, only: [:index, :create]
  resources :htmls ,only: [:index]do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'step6'
    end
  end
end
