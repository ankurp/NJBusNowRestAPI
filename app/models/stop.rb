class Stop < ActiveRecord::Base

  has_many :stop_times

  scope :for_trip -> (trip) { 
    joins(:stop_times => :trip)
    "LEFT JOIN stop_times ON trips.trip_id = stop_times.trip_id"
    .where("trips.trip_id = ?", trip) 
  }

end
