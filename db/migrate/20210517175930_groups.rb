class Groups < ActiveRecord::Migration[6.1]
  def change
    drop_table :groups
  end
end
