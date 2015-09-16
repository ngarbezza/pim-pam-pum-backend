[
    { nombre: 'Juntada',   descripcion: 'lalalalala',   fecha: 12.days.from_now },
    { nombre: 'Cumple', descripcion: 'lelelel', fecha: 1.month.from_now },
].each do |evento_attributes|
  Evento.create(evento_attributes)
end

User.create(email: 'admin@pim-pam-pum.com', password: 'password')
