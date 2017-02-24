class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:success] = 'Added friend'
      redirect_to root_path
    else
      flash[:error] = 'Cannot add friend'
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:friend_id])
    @friendship.destroy
    flash[:info] = 'Aww, you two no longer friend. How sad !!!'
    redirect_to root_path
  end
end
