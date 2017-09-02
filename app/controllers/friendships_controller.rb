class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:friendship][:followee_id])
    current_user.follow!(@user)
    redirect_to user_path(@user)
  end

  def destroy
    @user = Friendship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to user_path(@user)
  end

end
