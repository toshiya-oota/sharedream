class CommentsController < ApplicationController
  before_action :require_user_logged_in
  def create
    
    @comment = current_user.comments.build(comment_params)
    @dream = Dream.find(params[:dream_id])
    @comment.dream_id = @dream.id
    if @comment.save
      flash[:success] = 'メッセージを投稿しました!'
      redirect_to @dream
    else
      @comments = @dream.comments
      flash.now[:danger] = 'エラー？'
      render "dreams/show"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @dream = @comment.dream
    @comment.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to @dream
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end