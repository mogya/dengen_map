class Tag::CategoriesController < ApplicationController
  before_action :set_tag_category, only: [:show, :edit, :update, :destroy]

  # GET /tag/categories
  # GET /tag/categories.json
  def index
    @tag_categories = Tag::Category.all
  end

  # GET /tag/categories/1
  # GET /tag/categories/1.json
  def show
  end

  # GET /tag/categories/new
  def new
    @tag_category = Tag::Category.new
  end

  # GET /tag/categories/1/edit
  def edit
  end

  # POST /tag/categories
  # POST /tag/categories.json
  def create
    @tag_category = Tag::Category.new(tag_category_params)

    respond_to do |format|
      if @tag_category.save
        format.html { redirect_to @tag_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @tag_category }
      else
        format.html { render :new }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag/categories/1
  # PATCH/PUT /tag/categories/1.json
  def update
    respond_to do |format|
      if @tag_category.update(tag_category_params)
        format.html { redirect_to @tag_category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_category }
      else
        format.html { render :edit }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag/categories/1
  # DELETE /tag/categories/1.json
  def destroy
    @tag_category.destroy
    respond_to do |format|
      format.html { redirect_to tag_categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_category
      @tag_category = Tag::Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_category_params
      params[:tag_category]
    end
end
