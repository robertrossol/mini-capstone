class ProductsController < ApplicationController
  def index
    @products=Product.all
    render "index.html.erb"
  end

  def show
    product_id = params[:id]
    @products = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    product = Product.new(name: params[:form_name], price: params[:form_price],image: params[:image_name], description: params[:description_name])
    product.save
    render "create.html.erb"
  end
end
