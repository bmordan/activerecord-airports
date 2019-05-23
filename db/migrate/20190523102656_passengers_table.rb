class PassengersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |col|
      col.integer :plane_id
      col.string :name
    end
  end
end
