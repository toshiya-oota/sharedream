class CommentsController < ApplicationController
  def create
    
    @comment = current_user.comments.build(comment_params)
    @comment.dream_id = params[:dream_id]
    if @comment.save
       flash[:success] = '夢の続き'
      redirect_back(fallback_location: root_url)
    else
       flash.now[:danger] = 'エラー？'
      redirect_back(fallback_location: root_url)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end