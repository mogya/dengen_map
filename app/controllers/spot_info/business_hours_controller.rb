class SpotInfo::BusinessHoursController < ApplicationController
  before_action :set_spot_info_business_hour, only: [:show, :edit, :update, :destroy]

  # GET /spot_info/business_hours
  # GET /spot_info/business_hours.json
  def index
    @spot_info_business_hours = SpotInfo::BusinessHour.all
  end

  # GET /spot_info/business_hours/1
  # GET /spot_info/business_hours/1.json
  def show
  end

  # GET /spot_info/business_hours/new
  def new
    @spot_info_business_hour = SpotInfo::BusinessHour.new
  end

  # GET /spot_info/business_hours/1/edit
  def edit
  end

  # POST /spot_info/business_hours
  # POST /spot_info/business_hours.json
  def create
    @spot_info_business_hour = SpotInfo::BusinessHour.new(spot_info_business_hour_params)

    respond_to do |format|
      if @spot_info_business_hour.save
        format.html { redirect_to @spot_info_business_hour, notice: 'Business hour was successfully created.' }
        format.json { render :show, status: :created, location: @spot_info_business_hour }
      else
        format.html { render :new }
        format.json { render json: @spot_info_business_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spot_info/business_hours/1
  # PATCH/PUT /spot_info/business_hours/1.json
  def update
    respond_to do |format|
      if @spot_info_business_hour.update(spot_info_business_hour_params)
        format.html { redirect_to @spot_info_business_hour, notice: 'Business hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot_info_business_hour }
      else
        format.html { render :edit }
        format.json { render json: @spot_info_business_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spot_info/business_hours/1
  # DELETE /spot_info/business_hours/1.json
  def destroy
    @spot_info_business_hour.destroy
    respond_to do |format|
      format.html { redirect_to spot_info_business_hours_url, notice: 'Business hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot_info_business_hour
      @spot_info_business_hour = SpotInfo::BusinessHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_info_business_hour_params
      params[:spot_info_business_hour]
    end
end
