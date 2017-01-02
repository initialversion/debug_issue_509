class CreateQInvitations < ActiveRecord::Migration
  def change
    create_table :q_invitations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :status
      t.integer :queue_id

      t.timestamps

    end
  end
end
