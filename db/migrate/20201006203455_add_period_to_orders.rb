class AddPeriodToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :period, :string
  end
end
