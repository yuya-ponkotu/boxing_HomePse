class UsersController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create, :edit, :destroy]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      redirect_to root_path
    else
      flash[:danger] = "名前が入力されてません"
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新に成功した場合を扱う。
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

end
