class Trip < ActiveRecord::Base

  belongs_to :route
  has_many :stop_times

end