class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.integer :seed_track_id
      t.integer :inspiration_song_id
      t.integer :up_vote_count
      t.integer :down_vote_count
      t.integer :qlineup_id
      t.string :status

      t.timestamps

    end
  end
end
