Todo::Application.routes.draw do
  devise_for :users

  root to: 'stories#index'

  resources :stories

end
