class HomeController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).order('updated_at DESC').page(params[:page]).per(3)
  end

end
