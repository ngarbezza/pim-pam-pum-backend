class EventoSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :descripcion, :fecha
end
