class ConsiderPet < ActiveRecord::Base
  #model for connecting carts with pets. multiple pets per cart
  belongs_to :pet
  belongs_to :consider_cart
end
