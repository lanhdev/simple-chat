class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @backward_friendship = Friendship.new(user_id: params[:friend_id], friend_id: current_user.id)
    if @friendship.save and @backward_friendship.save
      flash[:success] = 'Added friend'
      redirect_to user_path(id: current_user.id)
    else
      flash[:error] = 'Cannot add friend'
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:friend_id])
    @backward_friendship = Friendship.find_by(user_id: params[:friend_id], friend_id: current_user.id)
    @friendship.destroy
    @backward_friendship.destroy
    flash[:info] = 'Aww, you two no longer friend. How sad !!!'
    redirect_to root_path
  end
end
