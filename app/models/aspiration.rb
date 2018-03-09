class Aspiration < ApplicationRecord
  # Direct associations

  has_many   :habits,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :habits,
             :source => :user

  # Validations

  validates :name, :uniqueness => { :message => "The aspiration already exists!" }

  validates :name, :presence => { :message => "What is your aspiration?" }

  validates :name, :length => { :minimum => 1, :maximum => 30 }

end
