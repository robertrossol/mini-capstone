class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :product, optional: true

  def calculate_totals
    product = Product.find_by(id: product_id)
    subtotal=product.price * quanity
    tax=subtotal*0.09
    total=subtotal+tax
    self.subtotal = subtotal
    self.tax = tax
    self.total = total

  end

end