class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true
  has_many :carted_products

  def calculate_totals
    @subtotal=0
    @tax
    @total
    #@cart_items=current_user.carted_products.where(status: "carted")
    @current_user.carted_products.each do |item|
      @subtotal+=item.product.price*item.quantity
      #product = Product.find_by(id: product_id)
      #subtotal=product.price * quantity
      @subtotal
    end
    @tax=@subtotal*0.09
    @total=@subtotal+@tax
    self.subtotal = @subtotal
    self.tax = @tax
    self.total = @total

  end

  def assign
    self.subtotal=@subtotal
  end

end
