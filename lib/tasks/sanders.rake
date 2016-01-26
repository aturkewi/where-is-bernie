namespace :sanders do
  desc "Display current data from API"
  task get_data: :environment do
    sanders = SandersAdapter.new
    new_data = sanders.get_all_events
    ap new_data
  end

end
