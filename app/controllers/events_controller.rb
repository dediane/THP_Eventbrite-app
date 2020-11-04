class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.event_admin = current_user

    if @event.save 
      redirect_to root_path
    else
      render new_event_path
    end
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :location, :description, :price)
  end
end
