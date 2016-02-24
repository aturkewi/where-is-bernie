class DataAdapter

  def add_new_events
    all_events = SandersAdapter.new.get_all_events
    add_events_to_db(all_events)
  end

  def add_events_to_db(all_events)
    all_events.each do |event|
      binding.pry
    end
  end

end
