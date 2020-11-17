class AddArtistToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :artist, :string
  end
end
