class ChangeJustifyToBeTextInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :justify, :text
  end
end
