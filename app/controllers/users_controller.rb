class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @shares = @user.shares
  end
  
end
