OnlineTimesheets::Application.routes.draw do
  
  root to: 'sessions#new'

  resources :timesheets do
    resources :entries
  end

  resources :users, only: [:new, :create]

  get "login" => "sessions#new", as: "login"
  post "sessions" => "sessions#create", as: "sessions"
  delete "logout" => "sessions#destroy", as: "logout"
  post "gone" => "timesheets#update_gone", as: "gone"

end
