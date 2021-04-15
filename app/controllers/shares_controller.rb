class SharesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
    @share = Share.find(params[:id])
    unless current_user == @share.user
      redirect_to action: :index
    end
  end

  def update
    if @share.update(share_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @share = Share.find(params[:id])
  end

  private

  def share_params
    params.require(:share).permit(:title, :share, :image).merge(user_id: current_user.id)
  end

end
