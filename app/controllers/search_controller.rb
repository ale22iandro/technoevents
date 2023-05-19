class SearchController < ApplicationController
  def index
    @events = Event.where("title like ?", "%#{params[:query]}%")
  end

  def favorites
    @event = Event.all
    liked_events = []
    @events.each do |event|
      if event.liked?(current_user)
        liked_events << event
      end
    end
    @events = liked_events
    render 'favorites'
  end
end