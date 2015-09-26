class Api::SessionsController < ApplicationController
  def create
    user = User.new(params[:user])
    user.save()


    render status: :ok, json: ''

  end

end