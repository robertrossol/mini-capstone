class ProductsController < ApplicationController
  def index
    if session[:count]==nil
      session[:count]=0
    end
      session[:count]+=1
      @page_count = session[:count]

    if params[:discounted]=="true"
      @products=Product.where("price < ?", 15)
    else
    sort_attribute=params[:sort_by] || "name"
    direction=params[:order] || "asc"
    @products=Product.all.order(sort_attribute => direction)
    render "index.html.erb"
    end
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.create(name: params[:form_name], price: params[:form_price], description: params[:form_description], supplier_id: params[:form_supplier])
      redirect_to "/products/#{@product.id}/images/new"
    # redirect_to "/products/#{@product.id}"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.price = params[:form_price]
    @product.description = params[:form_description]
    @product.supplier_id = params[:form_supplier]
    @product.save
    redirect_to "/products/#{@product.id}"
    #render "update.html.erb"
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render "destroy.html.erb"
  end
end
