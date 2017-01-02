class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :up_vote_count
      t.integer :down_vote_count
      t.string :status
      t.integer :qlineup_id

      t.timestamps

    end
  end
end
