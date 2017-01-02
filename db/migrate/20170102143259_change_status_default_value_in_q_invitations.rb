class ChangeStatusDefaultValueInQInvitations < ActiveRecord::Migration[5.0]
  def change
    change_column_default :q_invitations, :status, 'pending, accepted, or rejected'
  end
end
