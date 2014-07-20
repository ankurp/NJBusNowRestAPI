class Route < ActiveRecord::Base

  self.primary_key = :route_short_name

  has_many :trips

end
