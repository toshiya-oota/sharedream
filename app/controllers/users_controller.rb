class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :destroy, :user_sharedreams]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @dreams = @user.dreams.order('created_at DESC')
    @sharedreams = @user.user_sharedreams.order('created_at DESC')
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = '正常に削除されました'
    redirect_to #index
  end
  
  def user_sharedreams
    @user = User.find(params[:id])
    @user_sharedreams = @user.user_sharedreams
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:self_content, :image)
  end
  
end
