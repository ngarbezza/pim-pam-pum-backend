module Api
  class InvitadosController < ApplicationController

    def index
      # TODO intentar hacer con query para mejorar performance
      # usuarios = User.joins("LEFT JOIN invitaciones on users.id = invitaciones.user_id AND (NOT invitaciones.evento_id = #{params[:id_evento]})")
      #                .where.not('users.id = ?', current_user.id)
      #                .where('users.username LIKE ?', "%#{params[:q]}%")
      #                .uniq

      usuarios = User.includes(:invitaciones)
                     .where.not('users.id = ?', current_user.id)
                     .where('users.username LIKE ?', "%#{params[:q]}%")
      usuarios = usuarios.to_a.reject do |usuario|
        usuario.invitaciones.any? do |invitacion|
          invitacion.evento_id == params[:id_evento].to_i
        end
      end

      render json: { invitados: usuarios.map { |u| invitado_response(u) } }
    end

    private

    def invitado_response(usuario)
      { id: usuario.id, nombreUsuario: usuario.username }
    end
  end
end
