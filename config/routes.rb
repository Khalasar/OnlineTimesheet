OnlineTimesheets::Application.routes.draw do
  
  root to: 'users#new'

  resources :users, only: [:new, :create]

  get "timesheets" => "timesheets#index", as: "timesheets"
  get "login" => "sessions#new", as: "login"
  post "sessions" => "sessions#create", as: "sessions"
  delete "logout" => "sessions#destroy", as: "logout"
  post "timesheets" => "timesheets#index", as: "timesheets"

end
