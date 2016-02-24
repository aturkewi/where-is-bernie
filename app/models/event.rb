class Event < ActiveRecord::Base
  validates :sanders_id, uniqueness: true
  has_one :location

end
