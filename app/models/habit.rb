class Habit < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :length => { :minimum => 1, :maximum => 50 }

end
