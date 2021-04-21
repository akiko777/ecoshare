class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to share_path(@comment.share), notice: 'コメントしました'
    else
      @share = @comment.share
      @comments = @share.comments
      flash.now[:alert] = 'コメントを入力してください'
      render "shares/show"
    end
  end

  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, share_id: params[:share_id])
  end
end
