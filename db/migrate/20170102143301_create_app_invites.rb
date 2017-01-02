class CreateAppInvites < ActiveRecord::Migration
  def change
    create_table :app_invites do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :status

      t.timestamps

    end
  end
end
