class Fostered < ActiveRecord::Base
  #fostered is the housing of line_pets. fostered with no parent.
  has_many :line_pets, dependent: :destroy

end
