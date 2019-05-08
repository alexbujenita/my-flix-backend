# Users Controller for Auth
class UsersController < ApplicationController
  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if user.save
      payload = { user_id: user.id }
      token = issue_token(payload)

      render json: { jwt: token }
    else
      render json: { error: 'There was an error.' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
