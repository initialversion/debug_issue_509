class User < ApplicationRecord
  # Direct associations

  has_many   :q_invitations,
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :votes,
             :dependent => :destroy

  has_many   :suggestions,
             :dependent => :destroy

  has_many   :q_participants,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
