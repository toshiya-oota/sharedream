class DreamsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit,:update,:destroy]
  
  def show
    @dream = Dream.find(params[:id])
    @comments = @dream.comments
    @comment = Comment.new
  end
  
  def create
    @sharedreams = current_user.user_sharedreams.order('created_at DESC')
    @dream = current_user.dreams.build(dream_params)
    if @dream.save
      flash[:success] = 'start dream!'
      redirect_to root_url
    else
      @dreams = current_user.dreams.order('created_at DESC')
      @user = current_user
      flash.now[:danger] = '夢を描こう！'
      render 'toppages/index'
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end
  
  def update
    @dream = Dream.find(params[:id])
    
    if @dream.update(dream_params)
      flash[:success] = 'continue dream!'
      redirect_to @dream.user
    else
      @dreams = current_user.dreams.order('created_at DESC')
      flash.now[:danger] = 'エラー？'
      render 'toppages/index'
    end
  end

  def destroy
    @dream.destroy
    flash[:success] = 'next dream！'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def dream_params
    params.require(:dream).permit(:content, :image, :release)
  end
  
  def correct_user
    @dream = current_user.dreams.find_by(id: params[:id])
    unless @dream
      redirect_to root_url
    end
  end
  
end
