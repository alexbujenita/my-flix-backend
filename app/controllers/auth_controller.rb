class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}

      token = issue_token(payload)

      render json: { jwt: token, name: user.name }
    else
      render json: { error: "The token couldn't be created. Login failed."}
    end
  end

end
