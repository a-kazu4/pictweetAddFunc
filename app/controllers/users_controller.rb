class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.page(params[:page]).per(5).order('created_at DESC')
    @followings = @user.followings
    @followers = @user.followers
  end

  def following
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
  end

  def followers
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
  end

end
