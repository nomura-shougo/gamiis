class Replies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.references :post, foreign_key: true
      t.references :replied_to_post, foreign_key: { to_table: :posts }
      t.timestamps
    end
  end
end
