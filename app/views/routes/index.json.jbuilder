json.array!(@routes) do |route|
  json.extract! route, :id, :route_id, :agency_id, :route_short_namestring, :route_type
  json.url route_url(route, format: :json)
end
