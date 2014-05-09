class ConsiderCartsController < ApplicationController
  before_action :set_consider_cart, only: [:show, :edit, :update, :destroy]  #add pet in consider cart only in followed method

  # GET /consider_carts
  # GET /consider_carts.json
  def index
    @consider_carts = ConsiderCart.all    #get list
  end

  # GET /consider_carts/1
  # GET /consider_carts/1.json
  def show
  end

  # GET /consider_carts/new
  def new
    @consider_cart = ConsiderCart.new
  end

  # GET /consider_carts/1/edit
  def edit
  end

  # POST /consider_carts
  # POST /consider_carts.json
  def create
    # create a consider cart include current_pet
    @consider_cart = ConsiderCart.new(consider_cart_params)

    respond_to do |format|
      if @consider_cart.save
         #redirect to the instance variable include parameter
        format.html { redirect_to @consider_cart, notice: 'Consider cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consider_cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @consider_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consider_carts/1
  # PATCH/PUT /consider_carts/1.json
  def update
    respond_to do |format|
      #update consider_cart if current_pet changed
      if @consider_cart.update(consider_cart_params)
        #redirect to the instance variable include parameter
        format.html { redirect_to @consider_cart, notice: 'Consider cart was successfully updated.' }   
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consider_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consider_carts/1
  # DELETE /consider_carts/1.json
  def destroy
    #get cart_id in order to delete this cart
    @consider_cart.destroy if @consider_cart.id == session[:con_cart_id]  
    session[:con_cart_id] = nil
    respond_to do |format|
      format.html { redirect_to adoption_store_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_consider_cart
      @consider_cart = ConsiderCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # get current_pet
    def consider_cart_params
      params[:consider_cart]
    end
end
