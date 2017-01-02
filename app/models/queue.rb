class Queue < ApplicationRecord
  # Direct associations

  has_many   :q_participants,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
