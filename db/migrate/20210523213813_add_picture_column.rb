class AddPictureColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :picture, :string
  end
end
