class CreateUserLibraryTracks < ActiveRecord::Migration
  def change
    create_table :user_library_tracks do |t|
      t.integer :song_id
      t.string :song_name
      t.string :song_artist
      t.string :song_attributes
      t.string :number_of_listens
      t.string :genre
      t.date :last_listened_to_date
      t.string :song_release_date
      t.boolean :liked

      t.timestamps

    end
  end
end
