require 'twilio-ruby'
require_relative '../../lib/twilio_capability'

describe TwilioCapability do
  describe '.generate' do
    it 'generates a capability token' do
      token = described_class.generate 'dashboard'
      expect(token).to_not be_empty
    end
  end
end
