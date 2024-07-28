Rails.application.routes.draw do
  namespace :admin do
    get 'comments/index'
  end
  namespace :admin do
    get 'cafes/index'
  end
  namespace :admin do
    get 'reviews/index'
  end
  namespace :admin do
    get 'users/index'
  end
  get 'contacts/new'
  get 'contacts/confirm'
  get 'contacts/complete'
  
  get '/search', to: 'search#perform', as: 'search'
  
  # Deviseルーティング（Adminユーザー）
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # Deviseルーティング（一般ユーザー）
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # その他のルーティング
  # 静的ページ
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'help', to: 'static_pages#help'
  get 'contact', to: 'static_pages#contact'
  post 'contact/confirm', to: 'static_pages#confirm'
  get 'contact/complete', to: 'static_pages#complete'

  # ホームページ
  root to: 'home#index'
  get 'about', to: 'home#about'

  # ユーザー関連
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :relationships, only: [:create, :destroy]
  end

  # カフェ関連
  resources :cafes do
    resources :reviews, only: [:create, :edit, :update, :destroy]
    resources :reservations, only: [:create, :show, :edit, :update, :destroy]
    member do
      post 'favorite', to: 'favorites#create'
      delete 'unfavorite', to: 'favorites#destroy'
      get :confirm_delete
    end
  end

  # レビュー関連
  resources :reviews, only: [] do
    resources :comments, only: [:create, :edit, :update, :destroy]
    member do
      get 'confirm_delete'
    end
  end

  # 管理者関連
  namespace :admin do
    get 'dashboard', to: 'admins#dashboard'
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :cafes, only: [:index, :destroy]
    resources :reviews, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  end

  # 削除確認ページ
  get 'confirmations/:resource/:id', to: 'confirmations#show', as: 'confirm_delete'
  delete 'confirmations/:resource/:id', to: 'confirmations#destroy'
  
  get 'users/:id/confirm_deactivation', to: 'users#confirm_deactivation', as: :confirm_deactivation
  patch 'users/:id/deactivate', to: 'users#deactivate', as: :deactivate_user

  resources :contacts, only: [:new, :create] do
    collection do
      post 'confirm'
      post 'complete', to: 'contacts#complete'
      get 'complete', to: 'contacts#complete_page'
    end
  end
end