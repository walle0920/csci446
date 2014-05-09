class LinePet < ActiveRecord::Base
  #a line pet is a pet that has some connection to a cart or a parent.
  belongs_to :pet
  belongs_to :fostered
  belongs_to :foster_parent

  #the line pet needs to have a valid pet associated with it.
  validates :pet_id, presence: true

end
