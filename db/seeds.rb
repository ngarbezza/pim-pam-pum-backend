# Usuarios
user_admin = User.create!(username: 'admin', email: 'admin@pim-pam-pum.com', password: 'password')
user_simple = User.create!(username: 'simple', email: 'simple@pim-pam-pum.com', password: 'password')
user_nuevo = User.create!(username: 'nuevo', email: 'nuevo@pim-pam-pum.com', password: 'password')

# Eventos
juntada = Evento.create! nombre: 'Juntada',
                         descripcion: 'nos juntamos a jugar a la play',
                         fecha: 27.days.from_now,
                         owner: user_admin
choripateada = Evento.create! nombre: 'Choripateada',
                              descripcion: 'parrillada con amigos',
                              fecha: 12.days.from_now,
                              owner: user_admin
cumple = Evento.create! nombre: 'Cumple',
                        descripcion: 'Los 27 de Rochi',
                        fecha: 1.month.from_now,
                        owner: user_simple

# Invitaciones
Invitacion.create! user: user_simple, evento: juntada
Invitacion.create! user: user_simple, evento: choripateada
Invitacion.create! user: user_admin, evento: cumple
