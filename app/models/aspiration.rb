class Aspiration < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :uniqueness => { :message => "The aspiration already exists!" }

  validates :name, :presence => { :message => "What is your aspiration?" }

  validates :name, :length => { :minimum => 1, :maximum => 30 }

end
