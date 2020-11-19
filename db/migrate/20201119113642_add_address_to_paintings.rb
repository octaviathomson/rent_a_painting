class AddAddressToPaintings < ActiveRecord::Migration[6.0]
  def change
    add_column :paintings, :address, :string
  end
end
