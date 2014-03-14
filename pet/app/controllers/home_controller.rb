class HomeController < ApplicationController
  def index
  	@pets = Pet.order(:title)
  	@pets = Pet.order(:age)
  end
end
