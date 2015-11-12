class Api::UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:create]

  def create
    user = User.new(user_params)

    if user.save
      render status: :ok, json: user.to_json
    else
      render status: 422, json: {errors: user.errors}.to_json
    end

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
