class EventsCliApp::Event
  attr_accessor :name, :tags, :date, :website

  @@all = []

  def self.all
    @@all
  end

  def self.filter_by_tag(tag)
    event_matches_array = []
    @@all.each do |event|
      if event.tags.to_s.downcase.include?(tag)
        event_matches_array << event
      end
    end
    event_matches_array
  end

  def self.show_details(index)
    sorted_events = @@all.sort_by {|event| event.name}
    puts sorted_events[index].name
    puts sorted_events[index].date
    puts sorted_events[index].tags
    puts sorted_events[index].website
  end
end
