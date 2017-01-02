class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.boolean :up_vote
      t.boolean :down_vote
      t.integer :suggestion_id

      t.timestamps

    end
  end
end
