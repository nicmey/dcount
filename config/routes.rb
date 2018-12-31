Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'walks#rankings'

  resources :walks
  get '/dashboard', to: "dashboard#index"
end
