class QParticipant < ApplicationRecord
  # Direct associations

  has_many   :q_invitations,
             :foreign_key => "sender_id",
             :dependent => :destroy

  belongs_to :q,
             :class_name => "Queue",
             :foreign_key => "queue_id"

  belongs_to :user

  # Indirect associations

  # Validations

end
