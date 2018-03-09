class Habit < ApplicationRecord
  # Direct associations

  has_many   :logs,
             :dependent => :destroy

  belongs_to :aspiration

  belongs_to :user

  # Indirect associations

  # Validations

  validates :days_per_week, :presence => { :message => "How many days per week would you like to work on this habit?" }

  validates :days_per_week, :numericality => { :less_than_or_equal_to => 7, :greater_than_or_equal_to => 1 }

  validates :goal, :presence => { :message => "Why is this an important habit for you to develop?" }

  validates :goal, :length => { :minimum => 1, :maximum => 50 }

  validates :name, :uniqueness => { :message => "You are already working on this habit!" }

  validates :name, :presence => { :message => "What specific habit would you like to develop?" }

  validates :name, :length => { :minimum => 1, :maximum => 50 }

end
