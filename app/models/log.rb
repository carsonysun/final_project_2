class Log < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :date, :presence => { :message => "Select a valid date" }

end
