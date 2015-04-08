NJBusNowRestAPI
===============

REST Server returning NJ Transit Bus data

## API

```
          Prefix Verb   URI Pattern                      Controller#Action
      stop_times GET    /stop_times(.:format)            stop_times#index
                 POST   /stop_times(.:format)            stop_times#create
   new_stop_time GET    /stop_times/new(.:format)        stop_times#new
  edit_stop_time GET    /stop_times/:id/edit(.:format)   stop_times#edit
       stop_time GET    /stop_times/:id(.:format)        stop_times#show
                 PATCH  /stop_times/:id(.:format)        stop_times#update
                 PUT    /stop_times/:id(.:format)        stop_times#update
                 DELETE /stop_times/:id(.:format)        stop_times#destroy
      stops_trip GET    /trips/:id/stops(.:format)       trips#stops
           trips GET    /trips(.:format)                 trips#index
                 POST   /trips(.:format)                 trips#create
        new_trip GET    /trips/new(.:format)             trips#new
       edit_trip GET    /trips/:id/edit(.:format)        trips#edit
            trip GET    /trips/:id(.:format)             trips#show
                 PATCH  /trips/:id(.:format)             trips#update
                 PUT    /trips/:id(.:format)             trips#update
                 DELETE /trips/:id(.:format)             trips#destroy
           stops GET    /stops(.:format)                 stops#index
                 POST   /stops(.:format)                 stops#create
        new_stop GET    /stops/new(.:format)             stops#new
       edit_stop GET    /stops/:id/edit(.:format)        stops#edit
            stop GET    /stops/:id(.:format)             stops#show
                 PATCH  /stops/:id(.:format)             stops#update
                 PUT    /stops/:id(.:format)             stops#update
                 DELETE /stops/:id(.:format)             stops#destroy
directions_route GET    /routes/:id/directions(.:format) routes#directions
     data_routes GET    /routes/data(.:format)           routes#data
          routes GET    /routes(.:format)                routes#index
                 POST   /routes(.:format)                routes#create
       new_route GET    /routes/new(.:format)            routes#new
      edit_route GET    /routes/:id/edit(.:format)       routes#edit
           route GET    /routes/:id(.:format)            routes#show
                 PATCH  /routes/:id(.:format)            routes#update
                 PUT    /routes/:id(.:format)            routes#update
                 DELETE /routes/:id(.:format)            routes#destroy
```

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
