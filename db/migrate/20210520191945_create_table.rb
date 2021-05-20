class CreateTable < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.timestamps
    end
  end
end
