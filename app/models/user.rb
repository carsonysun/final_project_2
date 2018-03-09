class User < ApplicationRecord
  # Direct associations

  has_many   :habits,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => { :message => "Username has already been taken" }

  validates :username, :presence => { :message => "Pick a username" }

  validates :username, :length => { :minimum => 5, :maximum => 25 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
