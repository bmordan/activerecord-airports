class PlanesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :planes do |t|
      t.integer :airport_id
      t.string :destination
    end
  end
end
