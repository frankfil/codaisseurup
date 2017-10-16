class Api::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render status: 200, json: {
      events: Event.all
    }.to_json
  end

  def show
    event = Event.find(params[:id])

    render status: 200, json: {
      event: event
    }.to_json
  end

  def create
    event = Event.new(event_params)

    if event.save
      render status: 200, json: {
        message: "Event created",
        event: event
      }.to_json
    else
      render status: 422, json: {
        errors: event.errors
      }.to_json
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    render status: 200, json: {
      message: "Event successfully deleted"
    }.to_json
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render status: 200, json: {
        message: "Event successfully updated",
        event: event
      }.to_json
    else
       render status: 422, json: {
        message: "The event could not be updated",
        errors: event.errors
      }.to_json
    end
  end

  private

  def event_params
    params
      .require(:event).permit(:name, :description, :location, :includes_food, :includes_drinks, :price, :starts_at, :ends_at, :capacity, :active, category_ids: [])
  end
end

# curl -i -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{"name":"New title"}' http://localhost:3000/api/events/1
#
# curl -i -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{"name":"New title"}' http://localhost:3000/api/events/1
# curl -i -H "Accept: application/json" -X POST -d '{"name":"House", "description":"Shared", "location":"Utrecht", "includes_food":false, "includes_drinks":true, "price":1, "capacity":4, "starts_at":DateTime.now(), "ends_at":DateTime.now(), "active":true, "category_ids":[]}' http://localhost:3000/api/events
#
# curl -i -H "Accept: application/json" -X POST -d '{"name":"Any", "description":"Shared", "location":"Utrecht", "price":1, "capacity":4, "includes_food":false, "includes_drinks":true, "starts_at":DateTime.now(), "ends_at":DateTime.now(), "active":true, "category_ids":[],' http://localhost:3000/api/events
