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
      flash[:info] = "#{@user.name}を登録しました"
      redirect_to users_path
    else
      if user_params[:name].empty? && user_params[:yomigana].empty?
        flash[:danger] = "名前と読み方が入力されてません"
      elsif user_params[:name].empty?
        flash[:danger] = "名前が入力されてません"
      elsif user_params[:yomigana].empty?
        flash[:danger] = "読み方が入力されてません"
      end
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
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
      params.require(:user).permit(:name, :yomigana)
    end

end
