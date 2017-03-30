Rails.application.routes.draw do
  get "/" => "products#index"
  get "/suppliers" => "suppliers#index"
  get "/products" => "products#index"
  get "/products/new" => "products#new"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  get "/images" => "images#index"
  get "products/:id/images/" => "images#show"
  get "/products/:id/images/new" => "images#new"
  post "/images" => "images#create"
  get "/images/:id/edit" => "images#edit"
  patch "/images/:id" => "images#update"


  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"  

  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
