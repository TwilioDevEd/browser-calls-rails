require 'rails_helper'

RSpec.describe DashboardController do
  describe '#index' do
    it 'assigns tickets' do
      ticket = double('Ticket')
      allow(Ticket).to receive(:all) { [ticket] }

      get :index
      expect(assigns :tickets).to eq([ticket])
    end
  end
end
