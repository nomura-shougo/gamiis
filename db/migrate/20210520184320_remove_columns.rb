class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :replied_to_post_id, :bigint
  end
end
