class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
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
