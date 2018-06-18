class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
       	  t.belongs_to :user, index: true
	  	  t.integer :friend_id
		  t.string :status

      t.timestamps
    end

       add_index :friendships, [:user_id, :friend_id], unique: true
  end
end
