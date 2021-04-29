class LikesController < ApplicationController
  before_action :set_back, only: [:create, :destroy]

  def create
    # @share = Share.find(params[:share_id])
    @like = current_user.likes.create(share_id: params[:share_id])
    redirect_to post_path(@share)
  end

  def destroy
    # @share = Share.find(params[:share_id])
    like = Like.find_by(user_id: current_user.id, share_id: share.id)
    like.destroy
    redirect_to post_path(@share)
  end

  private

  def set_back
    redirect_back(fallback_location: root_path)
  end

end
