class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    relationship = current_user.active_relationships.find(params[:id])
    current_user.unfollow(relationship.followed)
    respond_to do |format|
      format.html { redirect_to relationship.followed }
      format.js
    end
  end
end
