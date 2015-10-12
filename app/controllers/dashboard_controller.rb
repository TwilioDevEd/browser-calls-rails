class DashboardController < ApplicationController
  def index
    @tickets = Ticket.all
  end
end
