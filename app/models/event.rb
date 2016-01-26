class Event < ActiveRecord::Base
  validate_uniquiness_with :sanders_id

  
end
