class Tag::WifisController < ApplicationController
  before_action :set_tag_wifi, only: [:show, :edit, :update, :destroy]

  # GET /tag/wifis
  # GET /tag/wifis.json
  def index
    @tag_wifis = Tag::Wifi.all
  end

  # GET /tag/wifis/1
  # GET /tag/wifis/1.json
  def show
  end

  # GET /tag/wifis/new
  def new
    @tag_wifi = Tag::Wifi.new
  end

  # GET /tag/wifis/1/edit
  def edit
  end

  # POST /tag/wifis
  # POST /tag/wifis.json
  def create
    @tag_wifi = Tag::Wifi.new(tag_wifi_params)

    respond_to do |format|
      if @tag_wifi.save
        format.html { redirect_to @tag_wifi, notice: 'Wifi was successfully created.' }
        format.json { render :show, status: :created, location: @tag_wifi }
      else
        format.html { render :new }
        format.json { render json: @tag_wifi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag/wifis/1
  # PATCH/PUT /tag/wifis/1.json
  def update
    respond_to do |format|
      if @tag_wifi.update(tag_wifi_params)
        format.html { redirect_to @tag_wifi, notice: 'Wifi was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_wifi }
      else
        format.html { render :edit }
        format.json { render json: @tag_wifi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag/wifis/1
  # DELETE /tag/wifis/1.json
  def destroy
    @tag_wifi.destroy
    respond_to do |format|
      format.html { redirect_to tag_wifis_url, notice: 'Wifi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_wifi
      @tag_wifi = Tag::Wifi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_wifi_params
      params[:tag_wifi]
    end
end
