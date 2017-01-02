class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :active

      t.timestamps

    end
  end
end
