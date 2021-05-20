class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.references :replied_to_post, foreign_key: { to_table: :posts }
      t.text :content
      t.integer :post_type
      t.timestamps
    end
  end
end
