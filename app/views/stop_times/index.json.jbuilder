json.array!(@stop_times) do |stop_time|
  json.extract! stop_time, :id, :trip_id, :arrival_time, :departure_time, :stop_id, :stop_sequence, :pickup_type, :drop_off_type, :shape_dist_traveled
  json.url stop_time_url(stop_time, format: :json)
end
