class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :text_content
      t.boolean :viewed

      t.timestamps
    end
	
	add_index :notifications, :user_id
  end
end
