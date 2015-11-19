class EventoLugar < ActiveRecord::Migration
    def change
      add_column :eventos, :direccion, :string
    end
end
