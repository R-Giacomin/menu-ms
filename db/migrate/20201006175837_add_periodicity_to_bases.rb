class AddPeriodicityToBases < ActiveRecord::Migration[6.0]
  def change
    add_column :bases, :periodicity, :string
  end
end
