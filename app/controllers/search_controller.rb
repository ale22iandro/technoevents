class SearchController < ApplicationController
  def index
    @events = Event.select {|event| event.title.downcase == params[:query].downcase}.map
    @query = params[:query]
  end

  def user_events(user_e)
    @events = Event.select{|event| event.user.email == user_e.email}
    render 'user_events_index'
  end
end