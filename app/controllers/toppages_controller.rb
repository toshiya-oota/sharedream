class ToppagesController < ApplicationController
  def index
    if logged_in?
      @dream = current_user.dreams.build  # form_for 用
      @dreams = current_user.dreams.order('created_at DESC')
    end  
  end
end
