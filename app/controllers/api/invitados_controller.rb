module Api
  class InvitadosController < ApplicationController

    def index
      render json: {invitados: User.all.map { |u| { id: u.id, nombre_usuario: u.username } } }
    end
  end
end
