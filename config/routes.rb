Rails.application.routes.draw do
  devise_for :user
  root to: 'subjects#index'
  resources :users, only: [:index, :edit, :update, :show] do
    member do
      get :following, :followers, :users_tweets
    end
  end
  resources :frends, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :subjects, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
  resources :messages, only: [:index, :create]
  end
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
