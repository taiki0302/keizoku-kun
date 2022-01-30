class ChangeJissekisToAchievements < ActiveRecord::Migration[5.2]
  def change
    rename_table :jissekis, :achievements
  end
end
