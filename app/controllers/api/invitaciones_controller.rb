module Api
  class InvitacionesController < ApplicationController
    include WardenHelper

    def index
      render json: Invitacion.all.to_json(include: :evento)
    end
  end
end
