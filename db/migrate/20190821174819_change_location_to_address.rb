class ChangeLocationToAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :location, :address
  end
end
