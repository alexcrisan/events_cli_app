class EventsCliApp::Event
  attr_accessor :name, :tags, :date, :website
  @@all = []

  def self.all
    @@all
  end

  def self.scrape_events
    doc = Nokogiri::HTML(open("http://downtownpittsburgh.com/events/"))
    doc.css(".eventitem").each do |event_item|
      event = self.new
      if event_item.css("a") != nil
        event.name = event_item.css("a").first.text.strip
      end
      if event_item.search("div.term").first != nil
        event.tags = event_item.search("div.term").first.text
      end
      if event_item.search("div.eventdate") != nil
        event.date = event_item.search("div.eventdate").first.text.gsub(/\n|\t/, "").strip
      end
      link = "http://downtownpittsburgh.com" + event_item.search("a.button").first.attr("href").strip
      doc_event = Nokogiri::HTML(open(link))
      if doc_event.search("div.eventlink") != nil
        event.website = doc_event.search("div.eventlink").first.css("a").first.attr("href").strip
      end
      @@all << event
    end
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
