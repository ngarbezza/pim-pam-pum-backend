class Invitacion < ActiveRecord::Base
  self.table_name = :invitaciones

  belongs_to :evento
  belongs_to :user
end
