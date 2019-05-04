class CommentsController < ApplicationController
  before_action :require_user_logged_in
  def create
    
    @comment = current_user.comments.build(comment_params)
    @comment.dream_id = params[:dream_id]
    if @comment.save
       flash[:success] = 'メッセージを投稿しました!'
      redirect_back(fallback_location: root_url)
    else
       flash.now[:danger] = 'エラー？'
      redirect_back(fallback_location: root_url)
    end
  end
  
  def destroy
    Comment.destroy(params[:id])
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end