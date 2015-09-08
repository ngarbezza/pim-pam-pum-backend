class EventoSerializer < ActiveModel::Serializer
  attributes :nombre, :descripcion, :fecha
end
