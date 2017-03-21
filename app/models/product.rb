class Product < ApplicationRecord
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: self.supplier_id)
  # end
  
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

  # def discounted?
  #   if price.to_f<15

  #   end
  # end
end
