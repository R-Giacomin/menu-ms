class CreateBases < ActiveRecord::Migration[6.0]
  def change
    create_table :bases do |t|
      t.string :name
      t.text :description
      t.text :legal_base
      t.string :technical_area
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
