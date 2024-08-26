Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'public/users/registrations',
    sessions: 'public/users/sessions'
  }
  devise_scope :user do
   end
  devise_for :shops, path: 'shop', controllers: {
    registrations: 'shop/shops/registrations',
    sessions: 'shop/shops/sessions'
  }
  devise_for :admins, path: 'admin', controllers: {
    registrations: 'admin/admins/registrations',
    sessions: 'admin/admins/sessions'
  }
  scope module: :public do
    root 'home#top'
    resources :menus, only: [:show, :index] do
      resources :comments, only: [:create]
    end
    resources :shops, only: [:show, :index] do
      resources :reviews, only: [:create]
    end
    resources :reviews, only: [:update]
  end
  namespace :shop do
    root 'menus#index'
    resources :menus
    resources :comments, only: [:create, :destroy]
  end
  namespace :admin do
    root to: "users#index"
    resources :users, only: [:index, :show, :destroy]
    resources :reviews, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end