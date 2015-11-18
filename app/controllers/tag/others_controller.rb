class Tag::OthersController < ApplicationController
  before_action :set_tag_other, only: [:show, :edit, :update, :destroy]

  # GET /tag/others
  # GET /tag/others.json
  def index
    @tag_others = Tag::Other.all
  end

  # GET /tag/others/1
  # GET /tag/others/1.json
  def show
  end

  # GET /tag/others/new
  def new
    @tag_other = Tag::Other.new
  end

  # GET /tag/others/1/edit
  def edit
  end

  # POST /tag/others
  # POST /tag/others.json
  def create
    @tag_other = Tag::Other.new(tag_other_params)

    respond_to do |format|
      if @tag_other.save
        format.html { redirect_to @tag_other, notice: 'Other was successfully created.' }
        format.json { render :show, status: :created, location: @tag_other }
      else
        format.html { render :new }
        format.json { render json: @tag_other.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag/others/1
  # PATCH/PUT /tag/others/1.json
  def update
    respond_to do |format|
      if @tag_other.update(tag_other_params)
        format.html { redirect_to @tag_other, notice: 'Other was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_other }
      else
        format.html { render :edit }
        format.json { render json: @tag_other.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag/others/1
  # DELETE /tag/others/1.json
  def destroy
    @tag_other.destroy
    respond_to do |format|
      format.html { redirect_to tag_others_url, notice: 'Other was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_other
      @tag_other = Tag::Other.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_other_params
      params[:tag_other]
    end
end
