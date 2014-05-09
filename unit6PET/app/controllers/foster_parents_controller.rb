class FosterParentsController < ApplicationController
  include FosterPlace
  include CurrentPet
  before_action :set_place, only: [:new, :create]
  before_action :set_foster_parent, only: [:show, :edit, :update, :destroy]



  # GET /foster_parents
  # GET /foster_parents.json
  def index
    @foster_parents = FosterParent.all
  end

  # GET /foster_parents/1
  # GET /foster_parents/1.json
  def show
  end

  # GET /foster_parents/new
  def new
    #If there are no line pets, redirect home and tell them so.
    if @place.line_pets.empty?
      redirect_to adoption_store_index_url, notice: "Your place is empty"
      return
    end

    #Otherwise, create a new foster parent.
    @foster_parent = FosterParent.new
  end

  # GET /foster_parents/1/edit
  def edit
  end

  # POST /foster_parents
  # POST /foster_parents.json
  def create
    #Get currently fostering pet
    the_pet = get_pet();

    #Make a new foster parent and set its id to the current pet's id
    @foster_parent = FosterParent.new(foster_parent_params)
    @foster_parent.pet_id = the_pet.id;

    #Update the pet's status to fostered
    the_pet.status = Pet::STAT[1];
    the_pet.save
    respond_to do |format|
      if @foster_parent.save
        format.html { redirect_to adoption_store_index_url, notice: "You are now the parent of #{the_pet.name}." }
        format.json { render action: 'show', status: :created, location: @foster_parent }
      else
        format.html { render action: 'new' }
        format.json { render json: @foster_parent.errors, status: :unprocessable_entity }
      end
    end

    #the else if couldn't save pet
  end

  # PATCH/PUT /foster_parents/1
  # PATCH/PUT /foster_parents/1.json
  def update
    respond_to do |format|
      if @foster_parent.update(foster_parent_params)
        format.html { redirect_to @foster_parent, notice: 'Foster parent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @foster_parent.errors, status: :unprocessable_entity }
      end
    end
  end

  #Determine who fostered a pet
  #TODO: implement method
  def who_fostered
    @fosters = FosterParent.order("created_at DESC")
    respond_to do |format|
      format.atom
    end
  end

  # DELETE /foster_parents/1
  # DELETE /foster_parents/1.json
  def destroy
    @foster_parent.destroy
    respond_to do |format|
      format.html { redirect_to foster_parents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foster_parent
      @foster_parent = FosterParent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foster_parent_params
      params.require(:foster_parent).permit(:name, :address, :email)
    end
end
