class CallController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def connect
    render xml: twilio_reponse.to_xml
  end

  private

  def twilio_reponse
    twilio_number = ENV['TWILIO_PHONE_NUMBER']

    Twilio::TwiML::Response.new do |response|
      response.Dial callerId: twilio_number do |dial|
        if params.include?(:phoneNumber)
          dial.Number params[:phoneNumber]
        else
          dial.Client('support_agent')
        end
      end
    end
  end
end
