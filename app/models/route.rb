class Route < ActiveRecord::Base

  self.primary_key = :route_short_name

  # manually writing relationship method as primary_key is set to route_short_name
  # has_many :trips
  def trips
    Trip.where(:route_id => self.route_id)
  end

end
