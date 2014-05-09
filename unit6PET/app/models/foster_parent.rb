class FosterParent < ActiveRecord::Base
  #this is the database model for people that foster the pets. Name, address, email, and pet info, are stored here.
  has_many :line_pets
  validates :name, :address, :email, presence: true
end
