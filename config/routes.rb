Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' } 
  root to: 'subjects#index'
  namespace :users do
    resources :searches, only: :index
  end
  resources :users do
    member do
      get 'tag'
      post 'taguser'
      post 'tagcreate'
      delete 'untag'
      get 'tagsearch'
      get :following, :followers, :users_tweets
    end
    resources :profiles, only:[:new,:create]
    resources :chats
  end
  resources :signup do
    collection do
      get 'step1'
      get 'step1sns'
      get 'step2'
      get 'step3'
      post 'step3create'
      
    end
    member do
      post 'tag'
      delete 'untag'
    end

  end
  resources :interests , only:[:index, :show] do
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
    member do
      post 'join'
    end
  resources :messages, only: [:index, :create]
  resources :albums do
    resources :photos
  end
    namespace :api do
      resources :messages, only: :index, defaults: { format: 'json' }
    end
    resources  :alerts, only: [:destroy] do
      member do
      post 'syoutai'
      end
    end
  end
  # resources :htmls ,only: [:index]do
  #   collection do
  #     get 'step1'
  #     get 'step2'
  #     get 'step3'
  #     get 'step4'
  #     get 'step5'
  #     get 'step6'
  #   end
  # end
end
