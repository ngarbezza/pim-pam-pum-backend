class InvitacionMailer < ApplicationMailer

  def nueva_invitacion(usuario, evento, destinatario)
    @evento = evento
    @usuario = usuario
    mail(to: destinatario.email, subject: "#{usuario.username} te ha invitado a un evento :-)")
  end
end
