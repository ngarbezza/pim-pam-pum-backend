class AsociarUsuarioConEvento < ActiveRecord::Migration
  def change
    add_column :eventos, :owner_id, :integer
  end
end
