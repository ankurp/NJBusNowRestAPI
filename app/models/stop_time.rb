class StopTime < ActiveRecord::Base

  belongs_to :trip
  belongs_to :stop, :primary_key => :stop_id

end
