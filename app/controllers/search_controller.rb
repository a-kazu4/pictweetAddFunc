class SearchController < ApplicationController
  def index
    @tweets = Tweet.where('text LIKE(?)', "%#{ search_params[:keyword] }%").order('text DESC').page(params[:page]).per(5)
  end

  private

  def search_params
    params.permit(:keyword)
  end
end
