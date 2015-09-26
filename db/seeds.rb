userAdmin = User.create(email: 'admin@pim-pam-pum.com', password: 'password')
userSimple = User.create(email: 'simple@pim-pam-pum.com', password: 'password')



[
    { nombre: 'Juntada',   descripcion: 'lalalalala',   fecha: 12.days.from_now, owner: userAdmin },
    { nombre: 'Cumple', descripcion: 'lelelel', fecha: 1.month.from_now , owner: userSimple},
].each do |evento_attributes|
  Evento.create(evento_attributes)
end

