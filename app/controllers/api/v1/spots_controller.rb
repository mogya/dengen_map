class Api::V1::SpotsController < Api::V1::BaseController
  def index
    @spots = Spot.spots_in_range(spot_search_params)
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
      ret[:tags] = params[:tags].split(',') if params[:tags]
      ret[:categories] = params[:categories].split(',') if params[:categories]
      ret[:wireless] = params[:wireless].split(',') if params[:wireless]
      ret[:limit] = params[:limit].to_i if params[:limit]
      ret[:contains_invalid] = true if params[:contains_invalid]
      ret[:compact] = true if params[:compact]
      ret
    end
end
