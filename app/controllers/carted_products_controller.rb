class CartedProductsController < ApplicationController

  def index
    @subtotal=0
    @tax
    @total
    @cart_items=current_user.carted_products.where(status: "carted")
    render "index.html.erb"


  end

  def create
    @cart_item = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      )
    redirect_to "/carted_products"
  end

  def destroy
    carted_product=CartedProduct.find_by(id: params[:id])
    carted_product.status ="removed"
    carted_product.save
    flash[:succes]="Product Removed"
    redirect_to "/carted_products"
  end
end
