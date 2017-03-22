class ImagesController < ApplicationController

  def index
    @images=Image.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @image= Image.create(url: params[:url], product_id: params[:product_id])
    redirect_to "/images"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

end
