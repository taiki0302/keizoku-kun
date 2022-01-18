class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :name
      t.integer :time
      t.timestamps
    end
  end
end
