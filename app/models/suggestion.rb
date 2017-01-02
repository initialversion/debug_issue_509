class Suggestion < ApplicationRecord
  # Direct associations

  belongs_to :qlineup,
             :class_name => "QLineup",
             :counter_cache => true

  has_many   :votes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
