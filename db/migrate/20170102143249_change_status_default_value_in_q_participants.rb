class ChangeStatusDefaultValueInQParticipants < ActiveRecord::Migration[5.0]
  def change
    change_column_default :q_participants, :status, 'Active or Inactive '
  end
end
