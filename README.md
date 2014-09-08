NJBusNowRestAPI
===============

Rest Server returning NJ Transit Bus data


## Start the server using `rails s`

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

## Relations

```ruby
class Trip < ActiveRecord::Base

  belongs_to :route
  has_many :stop_times

end
```
