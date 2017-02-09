class CreateUnfollows < ActiveRecord::Migration[5.0]
	def change
		create_table :unfollows do |t|
			t.integer :unfollower_id
			t.integer :unfollowed_id

			t.timestamps
		end
		add_index :unfollows, :unfollower_id
		add_index :unfollows, :unfollowed_id
		add_index :unfollows, [:unfollower_id, :unfollowed_id], unique: true
	end
end
