class CreateJissekis < ActiveRecord::Migration[5.2]
  def change
    create_table :jissekis do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :name
      t.integer :time
      t.timestamps
    end
  end
end
