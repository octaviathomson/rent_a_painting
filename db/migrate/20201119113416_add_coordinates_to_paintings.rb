class AddCoordinatesToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :latitude, :float
    add_column :paintings, :longitude, :float
  end
end
