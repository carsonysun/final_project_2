class User < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :username, :presence => { :message => "Pick a username" }

  validates :username, :length => { :minimum => 5, :maximum => 25 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
