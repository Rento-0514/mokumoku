class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    relationship = current_user.active_relationships.find(params[:id])
    current_user.unfollow(relationship.followed)
    redirect_to relationship.followed
  end
end
