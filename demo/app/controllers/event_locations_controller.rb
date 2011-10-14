class EventLocationsController < ApplicationController
  before_filter :find_event

  def show
    @location = @event.location
  end

  def new
    @location = @event.build_location
  end

  def create
    @location = @event.build_location( params[:location] )
    if @location.save
      redirect_to event_location_url( @event )
    else
      render :action => :new
    end
  end

  def edit
    @location = @event.location
  end

  def update
    @location = @event.location

    if @location.update_attributes( params[:location] )
      redirect_to event_location_url( @event )
    else
      render :action => :new
    end

  end

  def destroy
    @location = @event.location
    @location.destroy

    redirect_to event_location_url( @event )
  end

  protected

  def find_event
    @event = Event.find( params[:event_id] )
  end
end
