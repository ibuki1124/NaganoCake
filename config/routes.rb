Rails.application.routes.draw do
  # 管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }
  # 会員側
  scope module: :public do
    root to: 'homes#top'
    get 'about' => "homes#about", as: "about"
  end
end
