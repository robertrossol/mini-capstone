class OrdersController < ApplicationController
  def index
    render "index.html.erb"
  end
  def create
    # subtotal=0
    # @cart_items=current_user.carted_products.where(status: "carted")
    # @cart_items.each do |cart_item|
    #   subtotal += cart_item.quantity * cart_item.product.price
    # end
    # tax = subtotal * 0.09
    # total = subtotal + tax

    order=Order.new(user_id: current_user.id)
    order.save

    cart_items = current_user.carted_products.where(status: "carted")
    cart_items.update_all(status: "purchased", order_id: order.id)

    order.calculate_totals

    redirect_to "/orders/#{order.id}"
  end

  def show
    @order_id=params[:id]
    @order=Order.find_by(id: @order_id)
    # @user=User.where(user_id: @order.user_id)
    # @product=Product.where(product_id: @order.product_id)

    render "show.html.erb"

  end
end
