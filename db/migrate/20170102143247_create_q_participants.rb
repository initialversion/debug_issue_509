class CreateQParticipants < ActiveRecord::Migration
  def change
    create_table :q_participants do |t|
      t.integer :user_id
      t.string :status
      t.boolean :host_status
      t.integer :queue_id

      t.timestamps

    end
  end
end
