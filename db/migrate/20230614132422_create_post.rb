class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :users, null: false, foreign_key: true
      t.string :title, null: false
      t.text :text, null: false
      t.integer :comments_counter, default: 0
      t.string :likes_counter, default: 0

      t.timestamps
    end
  end
end
