class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event

  def create
    @registration = Registration.new(registration_params.merge(event_id: params[:event_id]))

    if @registration.save
      render status: 200, json: {
        message: "Registration successfully created",
        event: @event,
        registration: @registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be created",
        errors: registration.errors
      }.to_json
    end
  end

  def update
    registration = @event.registrations.find(params[:id])

    if registration.update(registration_params.merge(event_id: params[:event_id]))
      render status: 200, json: {
        message: "Registration successfully updated",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be updated",
        errors: registration.errors
      }.to_json
    end
  end

  def destroy
    registration = @event.registrations.find(params[:id])
    registration.destroy

    render status: 200, json: {
      message: "Event successfully deleted",
      event: @event,
      registation: registration
    }.to_json
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def registration_params
    params.require(:registration).permit(:starts_at, :ends_at, :price)
  end
end

# curl -i -H "Accept: application/json" -H "Content-type: application/json" -X DELETE http://localhost:3000/api/events/3/registations/3
# curl -i -H "Accept: application/json" -H "Content-type: application/json" -X PUT -d '{"starts_at":"2017-06-19","ends_at":"2017-06-30","price":"50.0"}' http://localhost:3000/api/events/2/registrations/1
# curl -i -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '{"starts_at":"2017-05-19","ends_at":"2017-05-30","price":"50.0"}' http://localhost:3000/api/events/2/registrations
