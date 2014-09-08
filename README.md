NJBusNowRestAPI
===============

Rest Server returning NJ Transit Bus data

## Getting Started
Start the server using `rails s`

## Database
Data is stored in the sqlite database bundled in this project for portability.

## Models
1. *Routes* - /routes will return all the NJ Transit bus routes
2. *Trips* - /trips will return all the trips for all the bus routes
3. *Stops* - /stops will give all the bus stops
4. *Stop Times* - /stop_times will give all the stop times at each bus stop

## Routes

```ruby
  resources :stop_times    # /stop_times

  resources :trips do      # /trips
    member do
      get "stops"          # /trips/88/stops
    end
  end

  resources :stops         # /stops

  resources :routes do     # /routes
    member do
      get "directions"     # /routes/88/directions
    end
    collection do
      get "data"           # /routes/data
    end
  end
```

## Relationships between Models

```ruby
class Trip < ActiveRecord::Base

  belongs_to :route
  has_many :stop_times

end


class StopTime < ActiveRecord::Base

  belongs_to :trip
  belongs_to :stop, :primary_key => :stop_id

end


class Stop < ActiveRecord::Base

  has_many :stop_times

end

class Route < ActiveRecord::Base

  ...

  # manually writing relationship method as primary_key is set to route_short_name
  # has_many :trips
  def trips
    ...
  end

  ...
end
```
