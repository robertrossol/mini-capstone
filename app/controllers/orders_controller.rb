class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quanity=params[:quanity].to_i
    tax=((product.price * 0.09).round(2))*quanity
    subtotal=product.price*quanity
    # order = Order.create(
    #   user_id: current_user.id,
    #   product_id: product.id,
    #   quanity: params[:quanity],
    #   subtotal: subtotal,
    #   tax: tax,
    #   total: subtotal+tax,
    #   )
    order=Order.new(
      quanity: params[:quanity],
      product_id: params[:product_id],
      user_id: current_user.id
      )
    order.calculate_totals
    order.save
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
