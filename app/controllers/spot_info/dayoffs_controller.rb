class SpotInfo::DayoffsController < ApplicationController
  before_action :set_spot_info_dayoff, only: [:show, :edit, :update, :destroy]

  # GET /spot_info/dayoffs
  # GET /spot_info/dayoffs.json
  def index
    @spot_info_dayoffs = SpotInfo::Dayoff.all
  end

  # GET /spot_info/dayoffs/1
  # GET /spot_info/dayoffs/1.json
  def show
  end

  # GET /spot_info/dayoffs/new
  def new
    @spot_info_dayoff = SpotInfo::Dayoff.new
  end

  # GET /spot_info/dayoffs/1/edit
  def edit
  end

  # POST /spot_info/dayoffs
  # POST /spot_info/dayoffs.json
  def create
    @spot_info_dayoff = SpotInfo::Dayoff.new(spot_info_dayoff_params)

    respond_to do |format|
      if @spot_info_dayoff.save
        format.html { redirect_to @spot_info_dayoff, notice: 'Dayoff was successfully created.' }
        format.json { render :show, status: :created, location: @spot_info_dayoff }
      else
        format.html { render :new }
        format.json { render json: @spot_info_dayoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spot_info/dayoffs/1
  # PATCH/PUT /spot_info/dayoffs/1.json
  def update
    respond_to do |format|
      if @spot_info_dayoff.update(spot_info_dayoff_params)
        format.html { redirect_to @spot_info_dayoff, notice: 'Dayoff was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot_info_dayoff }
      else
        format.html { render :edit }
        format.json { render json: @spot_info_dayoff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_info/dayoffs/1
  # DELETE /spot_info/dayoffs/1.json
  def destroy
    @spot_info_dayoff.destroy
    respond_to do |format|
      format.html { redirect_to spot_info_dayoffs_url, notice: 'Dayoff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot_info_dayoff
      @spot_info_dayoff = SpotInfo::Dayoff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_info_dayoff_params
      params[:spot_info_dayoff]
    end
end
