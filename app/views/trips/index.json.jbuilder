json.array!(@trips) do |trip|
  json.extract! trip, :id, :route_id, :service_id, :trip_id, :trip_headsign, :direction_id, :block_id, :shape_id
  json.url trip_url(trip, format: :json)
end
