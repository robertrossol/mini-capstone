class AddTotalColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
