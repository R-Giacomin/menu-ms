class CreateVariables < ActiveRecord::Migration[6.0]
  def change
    create_table :variables do |t|
      t.string :name
      t.text :description
      t.string :category
      t.boolean :sensibility
      t.references :base, null: false, foreign_key: true

      t.timestamps
    end
  end
end
