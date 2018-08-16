Rails.application.routes.draw do
  get "shops/index" => "shops#index"
  get "shops/search" 
  get "shops/new" => "shops#new"
  get "shops/show" => "shops#show"
  get "shops/:id" => "shops#show"
  post "shops/:id/destroy" => "shops#destroy"
  devise_for :users
  resources :shops
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
