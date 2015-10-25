class AgregarInvitaciones < ActiveRecord::Migration
  def change
    create_table :invitaciones do |t|
      t.belongs_to :evento, index: true
      t.belongs_to :user, index: true
      t.boolean :confirmado, default: false
      t.timestamps null: false
    end
  end
end
