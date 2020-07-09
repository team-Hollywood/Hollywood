Rails.application.routes.draw do
  root 'public/homes#top'
  namespace :public do
    resources :cart_items, only: [:create, :update, :destroy, :destroy_all, :index]
    resources :addresses, only: [:create, :update, :destroy, :edit, :index]
    post "orders/confirm"
    get "orders/thanks"
    resources :orders, only: [:new, :index, :show, :create]
    resources :products, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update]
    get "customers/unsubscribe"
    get "cart_items/destroy_all"
    get "homes/about" => "public/homes/about"
    patch "customers/hide" => "public/customers/hide" #退会時のupdateアクション
  end

  namespace :admins do
    resources :ordered_items, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :searches, only: [:index]
    get "homes/top"
  end

  devise_for :customers, path: :public, controllers: {
    sessions: 'public/devise/sessions',
    registrations: 'public/devise/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/devise/sessions',
    registrations: 'admins/devise/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
