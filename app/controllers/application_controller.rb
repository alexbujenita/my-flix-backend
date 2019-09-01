class ApplicationController < ActionController::API
  include MoviesHelper
  def issue_token(payload)
    JWT.encode(payload, Rails.application.credentials.dig(:jwt_secret))
  end
  
  def decode_token(token)
    JWT.decode(token, Rails.application.credentials.dig(:jwt_secret))[0]
  end

  def get_token
    request.headers['Authorization']
  end

  def no_call_current_user
    token = get_token
    decoded_token = decode_token(token)
    user = User.find(decoded_token['user_id'])
    {
      name: user[:name],
      email: user[:email],
      user_id: user[:id]
    }
  end
  
  def logged_in
    !!no_call_current_user
  end
end
