class AirportsTable < ActiveRecord::Migration[5.2]
  def up
    create_table :airports do |col|
      col.string :name
    end
  end

  def down
    remove_table :airports
  end
end
