class QInvitation < ApplicationRecord
  # Direct associations

  belongs_to :queue

  belongs_to :recipient,
             :class_name => "User"

  # Indirect associations

  # Validations

end
