class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :route_id
      t.string :agency_id
      t.string :route_short_name
      t.string :route_long_name
      t.string :route_url
      t.integer :route_type
      t.string :route_color

      t.timestamps
    end
  end
end
