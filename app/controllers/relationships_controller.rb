class RelationshipsController < ApplicationController
 before_action :require_user_logged_in
  
  def create
 dream = Dream.find(params[:dream_id])
   current_user.follow(dream)
   flash[:success] = 'Followしました！'
   redirect_to root_url
  end

  def destroy
    dream = Dream.find(params[:dream_id])
    current_user.unfollow(dream)
    flash[:success] = 'Followを解除しました。'
    redirect_to root_url
  end
end
