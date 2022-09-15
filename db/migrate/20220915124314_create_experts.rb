class CreateExperts < ActiveRecord::Migration[7.0]
  def change
    create_table :experts do |t|
      t.string :name
      t.float :score_a
      t.float :score_b
      t.float :score_c
      t.string :city
      t.integer :nb_sales

      t.timestamps
    end
  end
end
