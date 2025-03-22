Rails.application.routes.draw do
  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # 会員側
  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => "homes#about", as: "about"
    get "customers/my_page" => "customers#show", as: "my_page"
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :items, only: [:index, :show]
    resources :addresses, except: [:new, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    resources :orders, only: [:new, :create, :index, :show]
  end
end
