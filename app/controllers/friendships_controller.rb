class FriendshipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Following user"
    else
      flash[:alert] = "There was something wrong"
    end
    redirect_to my_friends_path
  end

  def destroy
    friend = User.find(params[:id])
    user_friend = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    user_friend.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end
end
