class ChangeRecipientIdDefaultValueInQInvitations < ActiveRecord::Migration[5.0]
  def change
    change_column_default :q_invitations, :recipient_id, 'what if recipient is not a queue user???'
  end
end
