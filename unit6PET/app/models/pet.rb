class Pet < ActiveRecord::Base
  # the main database intereaction for the pet.
  #The pet can be with line_pets and foster_parent through being a line_pet. (consider pet, agree to it, then foster it)
  has_many :line_pets
  has_many :foster_parents, through: :line_pets
  before_destroy :ensure_not_referenced

  #the status of the pet, whether it is fostered by someone or it still needs someone.
  STAT = ["available", "fostered"]

  #to go into the database, must have status, name, age, description, breed, years since been in shelter, tendencies,
  # a picture in url form.
  validates :status, inclusion: STAT
  validates :name, :age, :description, :breed, :stay, :tendencies, :picture, presence: true
  validates :picture, allow_blank: true, format: {
     with: %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG< or PNG image'
  }
  validates :age, :stay , numericality: {greater_than_or_equal_to: 0.01}

  #can only delete a pet if it is not a line_pet -> (being considered or actually fostered)
  private
  def ensure_not_referenced
    if line_pets.empty?
      return true
    else
      errors.add(:base, 'Line Pets present')
      return false
    end

  end
end
