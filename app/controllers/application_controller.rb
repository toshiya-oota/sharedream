class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
     @count_dreams = user.dreams.count
     @count_user_sharedreams = user.user_sharedreams.count
     @count_followdreams = user.followdreams.count
    # @count_dreamfollowers = user.dreamfollowers.dream.count
  end
end
