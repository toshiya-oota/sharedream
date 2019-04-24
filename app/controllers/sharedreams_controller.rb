class SharedreamsController < ApplicationController
  before_action :require_user_logged_in
  def create
   
   dream = Dream.find(params[:dream_id])
   current_user.share(dream)
   flash[:success] = 'Shareしました！'
   redirect_to root_url
  end

  def destroy
    dream = Dream.find(params[:dream_id])
    current_user.unshare(dream)
    flash[:success] = 'Shareを解除しました。'
    redirect_to root_url
  end
end
