class CreateWalks < ActiveRecord::Migration[5.0]
  def change
    create_table :walks do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
