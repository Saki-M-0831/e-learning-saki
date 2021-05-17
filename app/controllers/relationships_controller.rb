class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:followed_id]) 
    current_user.follow(other_user)

    redirect_to users_path
  end

  def destroy
    other_user = User.find(params[:followed_id]) 
    @relationship = Relationship.find(params[:id])
    @relationship.destroy

    redirect_to users_path
  end
end
