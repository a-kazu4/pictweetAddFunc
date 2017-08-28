class TweetsController < ApplicationController

  def index
    @tweets = Tweet.includes(:user).order('updated_at DESC').page(params[:page]).per(3)
  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if current_user.id == tweet.user_id
    redirect_to action: :index
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params) if current_user.id == tweet.user_id
    redirect_to action: :index
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  private

  def tweet_params
    params.permit(:image, :text)
  end

end
