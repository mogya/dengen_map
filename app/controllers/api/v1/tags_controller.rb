class Api::V1::TagsController < Api::V1::BaseController
  def index
    @categories = Tag::Category.all
    @wifi = Tag::Wifi.all
    @others = Tag::Other.all
    respond_with @categories,@wifi,@others
  end
end
