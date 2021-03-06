class ImagesController < ApplicationController

  def index
    @images=Image.all
    render "index.html.erb"
  end

  def new
    @product = Product.find_by(id: params[:id])
    render "new.html.erb"
  end

  def create
    @id=params[:product_id]
    @image= Image.create(url: params[:url], product_id: params[:product_id])
    redirect_to "/products/#{@id}/images/new"
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    @image = image.find_by(id: product_id)
    @image.url = params[:url]
    @image.save
    redirect_to "/products/#{@product.id}"
    #render "update.html.erb"
  end
end
