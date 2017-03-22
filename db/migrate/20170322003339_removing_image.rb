class RemovingImage < ActiveRecord::Migration[5.0]
    remove_column :products, :image, :string
  def change
  end
end
