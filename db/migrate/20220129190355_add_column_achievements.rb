class AddColumnAchievements < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :start_time, :date
  end
end
