Rails.application.routes.draw do
  

  get 'home/index'
  get 'job/index'
  get 'job/post_job'
  get 'mypage/index'

  #devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :users, path: "user", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "users/sessions", registrations: "users/registrations", passwords: "users/passwords", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_for :admins, path: "admin", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'registration', sign_up: 'get-register' }

  get '/auth/:provider/callback' => 'sessions#create'
  
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
  
  root to: "home#index"
end
