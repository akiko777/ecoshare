class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, share_id: params[:share_id])
    if URI(request.referer).path == "/shares" 
      redirect_to shares_path, notice: "いいねしました！"    
    else
      redirect_to share_path(@like.share.id), notice: "いいねしました！" 
    end
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, share_id: params[:share_id])
    if like.present?
      like.destroy
    end 
    if  URI(request.referer).path == "/shares"
      redirect_to shares_path, notice: "いいねを取り消しました！" 
    else 
      redirect_to share_path(like.share.id), notice: "いいねを取り消しました！" 
    end
  end

end