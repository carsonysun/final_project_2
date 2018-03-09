class Log < ApplicationRecord
  # Direct associations

  belongs_to :habit

  # Indirect associations

  # Validations

  validates :date, :presence => { :message => "Select a valid date" }

end
