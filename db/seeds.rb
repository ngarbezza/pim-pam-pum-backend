userAdmin = User.create(email: 'admin@pim-pam-pum.com', password: 'password')
userSimple = User.create(email: 'simple@pim-pam-pum.com', password: 'password')

[
    { nombre: 'Juntada',   descripcion: 'nos juntamos a jugar a la play',   fecha: 27.days.from_now, owner: userAdmin },
    { nombre: 'Choripateada',   descripcion: 'parrilada con amigos',   fecha: 12.days.from_now, owner: userAdmin },

    { nombre: 'Cumple', descripcion: 'Los 27 de rochi', fecha: 1.month.from_now , owner: userSimple},
].each do |evento_attributes|
  Evento.create(evento_attributes)
end

