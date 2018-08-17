Rails.application.routes.draw do
  get 'home/index'
  get "shops/index" => "shops#index"
  get "shops/search"
  get "shops/new" => "shops#new"
  get "shops/show" => "shops#show"
  get "shops/:id" => "shops#show"
  post "shops/:id/destroyDate" => "shops#destroyDate"
  devise_for :users
  resources :shops

  authenticated :users do
    root :to => "shops#index"
  end
  unauthenticated :users do
    root :to => "home#index"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
