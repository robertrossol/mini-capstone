class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :products, through: :carted_products
  has_many :carted_products

  def calculate_totals
    subtotal=0
    carted_products.each do |item|
      subtotal += item.quantity*item.product.price
    end
    tax = subtotal*0.09
    total = subtotal+tax
    update(subtotal: subtotal, tax: tax, total: total)
  end
end
