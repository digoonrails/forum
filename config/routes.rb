ForumApp::Application.routes.draw do
  root :to => 'forums#index'
  resources :forums
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"
end
