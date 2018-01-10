class Api::V1::SpotsController < Api::V1::BaseController
  MAX_SPOTS_COUNT = 500
  def index
    @spots = Spot.spots_in_range(spot_search_params)

    max_spots = params[:max_spots].try(:to_i) || MAX_SPOTS_COUNT
    @status = "OK"
    @status = "TOO_MUCH_SPOTS" if @spots.size > max_spots
    respond_with @spots
  end

  def count
    @spots = Spot.spots_in_range(spot_search_params)
    respond_with @spots
  end

  private
    def spot_search_params
      params.require(:n)
      params.require(:s)
      params.require(:w)
      params.require(:e)
      ret = {}
      ret[:n] = params[:n].to_f
      ret[:w] = params[:w].to_f
      ret[:s] = params[:s].to_f
      ret[:e] = params[:e].to_f
      ret[:latitude] = params[:latitude].to_f if params[:latitude]
      ret[:longitude] = params[:longitude].to_f if params[:longitude]
      ret[:tags] = Tag.split(params[:tags]) if params[:tags]
      ret[:categories] = Tag.split(params[:categories]) if params[:categories]
      ret[:wireless] = Tag.split(params[:wireless]) if params[:wireless]
      ret[:limit] = params[:limit].to_i if params[:limit]
      ret[:contains_invalid] = true if params[:contains_invalid]
      ret[:compact] = true if params[:compact]
      ret
    end
end
