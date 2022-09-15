class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :city
      t.integer :price
      t.references :expert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
