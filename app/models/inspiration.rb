class Inspiration < ApplicationRecord
  # Direct associations

  belongs_to :q_lineup,
             :foreign_key => "qlineup_id",
             :counter_cache => true

  has_many   :q_lineups,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
