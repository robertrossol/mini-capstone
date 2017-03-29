class Product < ApplicationRecord
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def sale_message
    price.to_i<15
  end

  def tax
    ((price * 0.09).round(2))
  end

  def total
    tax + price.to_f
  end

  def show_images
    images=Image.all
    images.select{|image| image[:product_id]==product[:id]}
  end
  # def discounted?
  #   if price.to_f<15

  #   end
  # end
end
