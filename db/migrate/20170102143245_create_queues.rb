class CreateQueues < ActiveRecord::Migration
  def change
    create_table :queues do |t|
      t.string :genres
      t.string :event_type
      t.string :status
      t.string :activity_type
      t.string :name
      t.boolean :public_queue
      t.boolean :allow_participants_to_invite
      t.string :group_or_event

      t.timestamps

    end
  end
end
