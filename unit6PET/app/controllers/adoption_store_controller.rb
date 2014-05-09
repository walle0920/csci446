class AdoptionStoreController < ApplicationController
 include CurrentConsidered  #get current considered pets
 before_action :set_cart    #create a cart if do not have a cart
  def index
    @order = params[:order_id]   #get order id 
    if @order.nil? or @order == "1" #get pet through age
      @pets = Pet.order(:name)   
      @pets.delete_if{|item| item.status == Pet::STAT[1]}  #make sure do not have dupllicate pet
    elsif @order == "2"          #get pet through age
      @pets = Pet.order(:age)
      @pets.delete_if{|item| item.status == Pet::STAT[1]}
    end
  end
end
