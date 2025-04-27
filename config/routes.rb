Rails.application.routes.draw do


  namespace :public do

  end

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
    get 'users/show'
    get 'users/edit'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
