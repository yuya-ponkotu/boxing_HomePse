class EntryExitManagementsController < ApplicationController
  require "date"

  def index
    @user = User.all
  end

  def update
    @user_ent = User.find_by(name: user_ent_params[:name])
    date = DateTime.now

    if params[:button] == "entry"
      if @user_ent.in_room == false
        @user_ent.in_room = true
        @user_ent.entry_time = date
      end
    end
    @user_ent.in_room = false if params[:button] == "exit"
    redirect_to root_path if @user_ent.save
  end

  private
    def user_ent_params
      params.require(:user).permit(:name)
    end
end
