class AddWeatherToWalks < ActiveRecord::Migration[5.0]
  def change
    add_column :walks, :city, :string
    add_column :walks, :weather, :string
    add_column :walks, :points, :integer
  end
end
