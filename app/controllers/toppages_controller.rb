class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @dream = current_user.dreams.build  # form_for 用
      @dreams = current_user.dreams.order('created_at DESC')
      @sharedreams = current_user.user_sharedreams.order('created_at DESC')
    end  
  end
end
