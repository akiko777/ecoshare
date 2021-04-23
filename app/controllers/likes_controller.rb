class LikesController < ApplicationController
  before_action :same_share, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, share_id: params[:share_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, share_id: params[:share_id])
    like.destroy
  end

  private

  def same_share
    @share = Share.find(params[:share_id])
  end

end
