class SpotInfo::SmokesController < ApplicationController
  before_action :set_spot_info_smoke, only: [:show, :edit, :update, :destroy]

  # GET /spot_info/smokes
  # GET /spot_info/smokes.json
  def index
    @spot_info_smokes = SpotInfo::Smoke.all
  end

  # GET /spot_info/smokes/1
  # GET /spot_info/smokes/1.json
  def show
  end

  # GET /spot_info/smokes/new
  def new
    @spot_info_smoke = SpotInfo::Smoke.new
  end

  # GET /spot_info/smokes/1/edit
  def edit
  end

  # POST /spot_info/smokes
  # POST /spot_info/smokes.json
  def create
    @spot_info_smoke = SpotInfo::Smoke.new(spot_info_smoke_params)

    respond_to do |format|
      if @spot_info_smoke.save
        format.html { redirect_to @spot_info_smoke, notice: 'Smoke was successfully created.' }
        format.json { render :show, status: :created, location: @spot_info_smoke }
      else
        format.html { render :new }
        format.json { render json: @spot_info_smoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spot_info/smokes/1
  # PATCH/PUT /spot_info/smokes/1.json
  def update
    respond_to do |format|
      if @spot_info_smoke.update(spot_info_smoke_params)
        format.html { redirect_to @spot_info_smoke, notice: 'Smoke was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot_info_smoke }
      else
        format.html { render :edit }
        format.json { render json: @spot_info_smoke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_info/smokes/1
  # DELETE /spot_info/smokes/1.json
  def destroy
    @spot_info_smoke.destroy
    respond_to do |format|
      format.html { redirect_to spot_info_smokes_url, notice: 'Smoke was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot_info_smoke
      @spot_info_smoke = SpotInfo::Smoke.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_info_smoke_params
      params[:spot_info_smoke]
    end
end
