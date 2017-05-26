class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registration = current_user.registrations.create(registration_params)
    redirect_to @registration.event, notice: "Thank you for registering!"
  end

  def total_price
    total_price = @event.price * guests_count
    puts total_price
  end

  private


  def registration_params
    params.require(:registration)
          .permit(:guests_count, :price, :total, :event_id)
          .merge(event_id: params[:event_id])
  end
end
