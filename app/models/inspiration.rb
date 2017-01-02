class Inspiration < ApplicationRecord
  # Direct associations

  has_many   :q_lineups,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
