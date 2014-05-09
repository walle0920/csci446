class ConsiderPetsController < ApplicationController
  include CurrentConsidered
  #crete a cart only before create method
  before_action :set_cart, only: [:create] 
  #get consider_pet only before those four method 
  before_action :set_consider_pet, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound , with: :invalid_cart

  # GET /consider_pets
  # GET /consider_pets.json
  #get consider pet list
  def index
    @consider_pets = ConsiderPet.all
  end

  # GET /consider_pets/1
  # GET /consider_pets/1.json
  def show
  end

  # GET /consider_pets/new
  def new
    @consider_pet = ConsiderPet.new
  end

  # GET /consider_pets/1/edit
  def edit
  end

  # POST /consider_pets
  # POST /consider_pets.json
  def create
    con_pet = Pet.find(params[:pets_id])
     #add pet include in id in the cart that created early
    @consider_pet = @con_cart.add_pet(con_pet.id)
    respond_to do |format|
      if @consider_pet.save
        format.html { redirect_to adoption_store_index_url }
        # Using AJAX
        format.js {@current_pet = @consider_pet}
        format.json { render action: 'show', status: :created, location: @consider_pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @consider_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consider_pets/1
  # PATCH/PUT /consider_pets/1.json
  def update
    respond_to do |format|
      #update consider_pet if current_pet changed
      if @consider_pet.update(consider_pet_params)
        format.html { redirect_to adoption_store_index_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consider_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consider_pets/1
  # DELETE /consider_pets/1.json
  def destroy
    @consider_pet.destroy
    respond_to do |format|
      format.html { redirect_to consider_pets_url }
      format.json { head :no_content }
    end
  end

  private
    # wrong cart id 
    def invalid_cart
      logger.error "Attempted to access invalid cart #{params[:id]}"
      redirect_to adoption_store_index_url, notice: 'Invalid Consider cart'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_consider_pet
      @consider_pet = ConsiderPet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consider_pet_params
      params.require(:consider_pet).permit(:pet_id)
    end
end
