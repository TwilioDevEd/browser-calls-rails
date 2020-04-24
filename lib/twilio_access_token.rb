# frozen_string_literal: true

require 'twilio-ruby'

# This class generates an access token with Twilio lib
class TwilioAccessToken
  def self.generate(role)
    # Create Voice grant for our token
    grant = Twilio::JWT::AccessToken::VoiceGrant.new
    grant.outgoing_application_sid = ENV['TWIML_APPLICATION_SID']

    # Optional: add to allow incoming calls
    grant.incoming_allow = true

    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['API_KEY'],
      ENV['API_SECRET'],
      [grant],
      identity: role
    )

    token.to_jwt
  end
end
