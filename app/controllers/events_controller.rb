class EventsController < ApplicationController
  before_action :authenticate_owner!, only: [:new, :create, :destroy, :update]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    flash[:info] = "予定を更新しました"
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:danger] = "予定を削除しました"
    redirect_to events_path
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:info] = "#{@event.title}を登録しました"
      redirect_to events_path
    else
      if event_params[:title].empty? && event_params[:content].empty?
        flash[:danger] = "件名と内容が入力されておりません"
      elsif event_params[:title].empty?
        flash[:danger] = "件名が入力されておりません"
      elsif event_params[:content].empty?
        flash[:danger] = "内容が入力されておりません"
      end
      render "new.html.erb"
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :content, :start_time)
    end
end
