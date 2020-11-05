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
      flash[:notice] = "Event created with success!"
      redirect_to root_path
    else
      flash[:alert] = "Failed to create a new evant - missing/wrong informations "
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:title, :start_date, :duration, :location, :description, :price)
  end
end
