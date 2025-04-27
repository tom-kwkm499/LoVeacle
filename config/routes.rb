Rails.application.routes.draw do


  devise_for :admins

  devise_for :users,skip: [:passwords],  controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :admin do
  end

  scope module: :public do
    root to: "homes#top"
    get 'users/mypage'
    resources :users, only: [:show, :edit, :update] do
      resources :cars, only: [:new, :create, :edit, :update, :destroy] do
        resources :posts
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
