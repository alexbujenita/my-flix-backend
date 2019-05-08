class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }

      token = issue_token(payload)

      render json: { jwt: token, name: user.name, email: user.email, user_id: user.id }
    else
      render json: { error: "The token couldn't be created. Login failed." }
    end
  end

  def show
    if logged_in
      render json: no_call_current_user
    else
      render json: { error: 'Try again!' }
    end
  end
end
