class SpotInfo::PowersuppliesController < ApplicationController
  before_action :set_spot_info_powersupply, only: [:show, :edit, :update, :destroy]

  # GET /spot_info/powersupplies
  # GET /spot_info/powersupplies.json
  def index
    @spot_info_powersupplies = SpotInfo::Powersupply.all
  end

  # GET /spot_info/powersupplies/1
  # GET /spot_info/powersupplies/1.json
  def show
  end

  # GET /spot_info/powersupplies/new
  def new
    @spot_info_powersupply = SpotInfo::Powersupply.new
  end

  # GET /spot_info/powersupplies/1/edit
  def edit
  end

  # POST /spot_info/powersupplies
  # POST /spot_info/powersupplies.json
  def create
    @spot_info_powersupply = SpotInfo::Powersupply.new(spot_info_powersupply_params)

    respond_to do |format|
      if @spot_info_powersupply.save
        format.html { redirect_to @spot_info_powersupply, notice: 'Powersupply was successfully created.' }
        format.json { render :show, status: :created, location: @spot_info_powersupply }
      else
        format.html { render :new }
        format.json { render json: @spot_info_powersupply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spot_info/powersupplies/1
  # PATCH/PUT /spot_info/powersupplies/1.json
  def update
    respond_to do |format|
      if @spot_info_powersupply.update(spot_info_powersupply_params)
        format.html { redirect_to @spot_info_powersupply, notice: 'Powersupply was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot_info_powersupply }
      else
        format.html { render :edit }
        format.json { render json: @spot_info_powersupply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_info/powersupplies/1
  # DELETE /spot_info/powersupplies/1.json
  def destroy
    @spot_info_powersupply.destroy
    respond_to do |format|
      format.html { redirect_to spot_info_powersupplies_url, notice: 'Powersupply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot_info_powersupply
      @spot_info_powersupply = SpotInfo::Powersupply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_info_powersupply_params
      params[:spot_info_powersupply]
    end
end
