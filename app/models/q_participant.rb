class QParticipant < ApplicationRecord
  # Direct associations

  belongs_to :q,
             :class_name => "Queue",
             :foreign_key => "queue_id"

  belongs_to :user

  # Indirect associations

  # Validations

end
