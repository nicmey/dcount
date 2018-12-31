class AddDateToWalks < ActiveRecord::Migration[5.0]
  def up
    add_column :walks, :date, :datetime
    Walk.all.each do |walk|
      walk.update(date: walk.created_at)
    end
  end

  def down
    remove_column :walks, :date
  end
end
