Rails.application.routes.draw do
  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
  end
  # 会員側
  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => "homes#about", as: "about"
  end
end
