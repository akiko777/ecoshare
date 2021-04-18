class SharesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_share, only: [:edit, :update, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @shares = Share.all
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    if @share.save
       redirect_to root_path(@share)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @share.update(share_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @share.destroy
      redirect_to root_path, notice: "削除しました"
    else
      render :show
    end
  end

  private

  def share_params
    params.require(:share).permit(:title, :share, :image).merge(user_id: current_user.id)
  end

  def set_share
    @share = Share.find(params[:id])
  end

  def contributor_confirmation
    unless current_user == @share.user
      redirect_to action: :index
    end
  end

end
