class Api::EventsController < ApplicationController
  def index
    render status: 200, json: {
      rooms: Event.all
    }.to_json
  end
end
