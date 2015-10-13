require 'rails_helper'

describe TokenController do
  describe '#generate' do
    it 'generates capability token' do
      allow(TwilioCapability).to receive(:generate) { 'generated_token' }

      post :generate
      expect(response.body).to eq({ token: 'generated_token' }.to_json)
    end
  end
end
