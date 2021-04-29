class LikesController < ApplicationController
  before_action :same_share, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, share_id: params[:share_id])
    redirect_to shares_path, notice: "いいねしました！"
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, share_id: params[:share_id])
    if like.present?
      like.destroy
    end
    redirect_to shares_path, notice: "いいねを取り消しました！"
  end

  private

  def same_share
    @share = Share.find(params[:share_id])
  end

end
