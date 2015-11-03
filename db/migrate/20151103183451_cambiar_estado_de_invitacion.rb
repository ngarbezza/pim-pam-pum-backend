class CambiarEstadoDeInvitacion < ActiveRecord::Migration
  def change
    remove_column :invitaciones, :confirmado, :boolean
    add_column :invitaciones, :estado, :string, null: false, default: 'SIN_CONFIRMAR'
  end
end
