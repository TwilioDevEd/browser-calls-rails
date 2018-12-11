require 'rails_helper'

describe TicketsController do
  describe '#create' do
    let(:ticket_params) do
      {
        ticket: {
          name: 'name',
          phone_number: '+12025550166',
          description: 'description'
        }
      }
    end

    it 'creates a ticket' do
      expect do
        post :create, params: ticket_params
      end.to change(Ticket, :count).by(1)
    end

    it 'redirects to root path' do
      post :create, params: ticket_params
      expect(response).to redirect_to root_path
    end

    it 'do not create a ticket if params are invalid' do
      expect do
        post :create, params: { ticket: { name: '' } }
      end.to_not change(Ticket, :count)
    end
  end
end
