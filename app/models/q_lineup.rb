class QLineup < ApplicationRecord
  # Direct associations

  has_many   :inspirations,
             :foreign_key => "qlineup_id",
             :dependent => :destroy

  belongs_to :inspiration

  belongs_to :q,
             :class_name => "Queue"

  # Indirect associations

  # Validations

end
