class HomeController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).order('updated_at DESC').page(params[:page]).per(5)
    @tweet = Tweet.new
  end

  def post
    current_user.tweets.create(tweet_params)
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:image, :text)
  end
end
