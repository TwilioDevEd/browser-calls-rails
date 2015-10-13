class TwilioCapability
  def self.generate(role)
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    capability = Twilio::Util::Capability.new account_sid, auth_token

    application_sid = ENV['TWIML_APPLICATION_SID']
    capability.allow_client_outgoing application_sid
    capability.allow_client_incoming role

    capability.generate
  end
end
