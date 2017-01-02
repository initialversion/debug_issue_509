class Suggestion < ApplicationRecord
  # Direct associations

  has_many   :votes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
