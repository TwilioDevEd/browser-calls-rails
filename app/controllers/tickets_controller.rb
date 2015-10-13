class TicketsController < ApplicationController
  def create
    support_ticket = Ticket.new(ticket_params)

    if support_ticket.save
      redirect_to root_path, notice:
        'Your ticket was submitted! An agent will call you soon.'
    else
      redirect_to root_path, flash:
        { error: support_ticket.errors.full_messages }
    end
  end

  def ticket_params
    params.require(:ticket).permit(:name, :phone_number, :description)
  end
end
