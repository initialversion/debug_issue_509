class QLineup < ApplicationRecord
  # Direct associations

  belongs_to :inspiration

  belongs_to :q,
             :class_name => "Queue"

  # Indirect associations

  # Validations

end
