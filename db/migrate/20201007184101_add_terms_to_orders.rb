class AddTermsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :terms, :boolean, default: false
  end
end
