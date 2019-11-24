class AuthenticationController < ApplicationController
  def authenticate
    auth_token = 
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end
  
  private

  def auth params
    params.permit(:email, :password)
  end
end
