class OrdersController < ApplicationController
  def index
    render "index.html.erb"
  end
  def create
    # product = Product.find_by(id: params[:product_id])
    # quantity=params[:quantity].to_i
    # tax=((product.price * 0.09).round(2))*quantity
    # subtotal=product.price*quantity

    # order = Order.create(
    #   user_id: current_user.id,
    #   product_id: product.id,
    #   quantity: params[:quantity],
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: subtotal+tax,
    #   )
    @cart_items=current_user.carted_products.where(status: "carted")

    order=Order.create(
      user_id: current_user.id,
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
      )
    @cart_items.each do |item|
      item.update(
        order_id: order.id,
        status: "purchased"
        )
    end
    redirect_to "/orders/#{order.id}"
  end

  def show
    order_id=params[:id]
    @order=Order.find_by(id: order_id)
    # @user=User.where(user_id: @order.user_id)
    # @product=Product.where(product_id: @order.product_id)

    render "show.html.erb"

  end
end
