class Api::UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:create]

  def create
    user = User.new(user_params)
    user.save()


    render status: :ok, json: ''

  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end