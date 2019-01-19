class Api::UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])

    json_response user_hash(@user)
  end

  private
  def user_hash(user)
    {
      user: {
        id: user.id,
        username: user.username
      }
    }
  end
end
