require 'csv'

# CSV.open("#{Rails.root}/db/routes.txt", :headers => true, :header_converters => :symbol, :col_sep => ',').each do |row|
#   Route.new(row.to_h).save
# end

# CSV.open("#{Rails.root}/db/stop_times.txt", :headers => true, :header_converters => :symbol, :col_sep => ',').each do |row|
#   StopTime.new(row.to_h).save
# end

# CSV.open("#{Rails.root}/db/stops.txt", :headers => true, :header_converters => :symbol, :col_sep => ',').each do |row|
#   Stop.create(row.to_h)
# end

# CSV.open("#{Rails.root}/db/trips.txt", :headers => true, :header_converters => :symbol, :col_sep => ',').each do |row|
#   Trip.create(row.to_h)
# end
