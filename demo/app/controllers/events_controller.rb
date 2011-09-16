# encoding: utf-8
class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event])
    @event.save

    flash[:notice] = "event was successfully created"
    redirect_to :action => :index
  end
  
  def show
    @event = Event.find(params[:id])
    @page_title = @event.name
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])

    flash[:notice] = "event was successfully updated"
    redirect_to :action => :show, :id => @event
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    flash[:alert] = "event was successfully deleted"
    redirect_to :action => :index
  end
  
end
