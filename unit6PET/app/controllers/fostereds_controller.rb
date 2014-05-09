class FosteredsController < ApplicationController
  include FosterPlace
  before_action :set_place, only:[:edit]
  before_action :set_fostered, only: [:show, :edit, :update, :destroy]

  # GET /fostereds
  # GET /fostereds.json
  def index
    @fostereds = Fostered.all
  end

  # GET /fostereds/1
  # GET /fostereds/1.json
  def show
  end

  # GET /fostereds/new
  def new
    @fostered = Fostered.new
  end

  # GET /fostereds/1/edit
  def edit
    if !user_signed_in? and !admin_signed_in?
      redirect_to :back, notice: "You must be signed in to foster a pet"
    end
  end

  # POST /fostereds
  # POST /fostereds.json
  def create
    @fostered = Fostered.new(fostered_params)

    respond_to do |format|
      if @fostered.save
        format.html { redirect_to @fostered, notice: 'Fostered was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fostered }
      else
        format.html { render action: 'new' }
        format.json { render json: @fostered.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fostereds/1
  # PATCH/PUT /fostereds/1.json
  def update
    respond_to do |format|
      if @fostered.update(fostered_params)
        format.html { redirect_to @fostered, notice: 'Fostered was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fostered.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fostereds/1
  # DELETE /fostereds/1.json
  def destroy
    @fostered.destroy
    respond_to do |format|
      format.html { redirect_to fostereds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fostered
      @fostered = Fostered.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fostered_params
      params[:fostered]
    end
end
