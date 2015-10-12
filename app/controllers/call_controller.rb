class CallController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def connect
    twilio_number = ENV['TWILIO_PHONE_NUMBER']
    response = Twilio::TwiML::Response.new do |r|
      r.Dial callerId: twilio_number do |d|
        if params.include?(:phoneNumber)
          d.Number params[:phoneNumber]
        else
          d.Client('support_agent')
        end
      end
    end

    render xml: response.to_xml
  end
end
