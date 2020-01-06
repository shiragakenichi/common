Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } 
  root to: 'subjects#index'
  resources :users do
    member do
      get :newsns
      get :following, :followers, :users_tweets
    end
    resources :profiles, only:[:new,:create]
  end
  resources :signup do
    collection do
      get 'step1'
      get 'step1sns'
      get 'step2'
      post 'step2create'
      get 'step3'
      post 'step3create'
      
    end
    member do
      post 'tag'
      delete 'untag'
    end

  end
  resources :frends, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :subjects, only: [:index, :edit, :update]
  resources :groups do
  resources :messages, only: [:index, :create]
  resources :albums
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
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
