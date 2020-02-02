class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    friendship = Friendship.create(user: current_user, friend: friend)
    if friendship.save
    flash[:notice] = "Following friend"
    redirect_to friends_path
    else
      flash[:notice] = "Something went wrong"
      redirect_to friends_path
    end
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to friends_path
  end
end
