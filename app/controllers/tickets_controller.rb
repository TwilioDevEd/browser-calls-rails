class TicketsController < ApplicationController
  def create
    Ticket.create(ticket_params)
    redirect_to root_path
  end

  def ticket_params
    params.require(:ticket).permit(:name, :phone_number, :description)
  end
end
