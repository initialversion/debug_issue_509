class Vote < ApplicationRecord
  # Direct associations

  belongs_to :suggestion

  belongs_to :user

  # Indirect associations

  # Validations

end
