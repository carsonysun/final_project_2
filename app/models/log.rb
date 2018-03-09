class Log < ApplicationRecord
  # Direct associations

  has_many   :accomplishments,
             :dependent => :destroy

  belongs_to :habit

  # Indirect associations

  # Validations

  validates :date, :presence => { :message => "Select a valid date" }

end
