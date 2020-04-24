require 'twilio-ruby'
require_relative '../../lib/twilio_access_token'

describe TwilioAccessToken do
  describe '.generate' do
    it 'generates a twilio access token' do
      token = described_class.generate('dashboard')
      expect(token).to_not be_empty
    end
  end
end
