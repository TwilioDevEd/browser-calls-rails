class TokenController < ApplicationController
  def generate
    token = TwilioCapability.generate(params[:page])
    render json: {token: token}
  end
end
