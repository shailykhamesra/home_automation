Rails.application.routes.draw do

  root :to => 'index#index'

  get 'login/login'
  post 'login/attempt_login'
  get 'login/logout'

  get 'index/index'

  get 'home/index'
  get 'home/edit'

  get 'manual/index'
  get 'manual/toggle'

  resources :admin_users
  resources :controls
  resources :main_switches
end
