Rails.application.routes.draw do
  get "/all_products.url" => "products#all_products"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
