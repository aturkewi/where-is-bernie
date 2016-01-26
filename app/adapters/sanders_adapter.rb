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
      query(event_id)
    end.flatten
  end

end
