class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.integer :category
      t.string :justify
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
