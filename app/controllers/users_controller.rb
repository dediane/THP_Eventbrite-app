class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def show
    @user = User.find(params[:id])
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(post_params)
      redirect_to user_path
    end
  end

  def post_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end
end
