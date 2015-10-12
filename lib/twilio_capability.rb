class TwilioCapability
  def self.generate(page)
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    capability = Twilio::Util::Capability.new account_sid, auth_token

    application_sid = ENV['TWIML_APPLICATION_SID']
    capability.allow_client_incoming application_sid
    capability.allow_client_incoming page

    token = capability.generate
  end
end
