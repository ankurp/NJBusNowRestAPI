json.array!(@stops) do |stop|
  json.extract! stop, :id, :stop_id, :stop_code, :stop_name, :stop_desc, :stop_lat, :stop_lon, :zone_id
  json.url stop_url(stop, format: :json)
end
