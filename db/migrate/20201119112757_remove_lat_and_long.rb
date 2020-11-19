class RemoveLatAndLong < ActiveRecord::Migration[6.0]
  def change
    remove_column :paintings, :latitude
    remove_column :paintings, :longitude
    remove_column :paintings, :address
  end
end
