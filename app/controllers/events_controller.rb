class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.select { |event| event.datetime >= Time.now }.sort_by(&:created_at).reverse
    @events_ex = Event.select { |event| event.datetime < Time.now }.sort_by(&:datetime).reverse
  end

  def show
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end


  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end
  helper_method :current_user_can_edit?

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :event_type, :datetime, :description, :image)
  end

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end
end
