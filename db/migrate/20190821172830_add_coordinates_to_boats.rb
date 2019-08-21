class AddCoordinatesToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :latitude, :float
    add_column :boats, :longitude, :float
    add_column :boats, :price, :integer
  end
end
