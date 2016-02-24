class SandersAdapter
  include HTTParty

  attr_reader :connection

  EVENT_IDS=[5,14]

  def initialize
    @connection = self.class
  end

  def query(event_id)
    results = connection.get("https://go.berniesanders.com/page/event/search_results?country=US&event_type=#{event_id}&format=json")
    # RecursiveOpenStruct.new(results, :recurse_over_arrays => true)
  end

  def get_all_events
    EVENT_IDS.collect do |event_id|
      query(event_id)["results"]
    end.flatten
  end

  def create_event_from_api(api_event)
    event = Event.new
    event.name = api_event['name']
    event.sanders_id = api_event['id']
    event.url = api_event['url']
    event.start = api_event['start_dt']
    event.description = api_event['description']
    event.event_type = api_event['event_type_name']
    event.sanders_id = api_event['id']
    event
  end

  def create_location_from_api(event, api_event)
    location = event.build_location
    location.name = api_event['venue_name']
    location.lat = api_event['latitude']
    location.long = api_event['longitude']
    location.address = api_event['venue_addr1']
    location.city = api_event['venue_city']
    location.state = api_event['venue_state_cd']
    location.zip = api_event['venue_zip']
    location.save
  end

  def store_events_in_db
    api_events = get_all_events
    api_events.each do |api_event|
      unless Event.find_by(sanders_id:api_event["id"])
        event = create_event_from_api(api_event)
        event.save
        create_location_from_api(event, api_event)
      end
    end
  end

end
