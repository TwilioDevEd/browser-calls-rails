require 'pry'

class TwilioCapability
  def self.generate(role)
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    # account_sid     = ENV['TWILIO_ACCOUNT_SID']
    # auth_token      = ENV['TWILIO_AUTH_TOKEN']
    # application_sid = ENV['TWIML_APPLICATION_SID']
    
    # account_sid     = Rails.application.secrets.twilio['account_sid']
    # auth_token      = Rails.application.secrets.twilio['auth_token']
    # application_sid = Rails.application.secrets.twilio['application_sid']

    capability = Twilio::JWT::ClientCapability.new(account_sid, auth_token)
    outgoing_scope = Twilio::JWT::ClientCapability::OutgoingClientScope.new(app_sid, role)
    capability.add_scope outgoing_scope

    incoming_scope = Twilio::JWT::ClientCapability::IncomingClientScope.new(role)
    capability.add_scope incoming_scope
    capability.to_s
  end
end
