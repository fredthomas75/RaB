class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :capacity
      t.integer :year
      t.integer :num_of_cabin
      t.string :category
      t.string :equipement
      t.references :brand_model, foreign_key: true

      t.timestamps
    end
  end
end
