class RemoveQuanity < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :quanity, :integer
  end
end
