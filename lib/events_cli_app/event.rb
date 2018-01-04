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
      event.name = event_item.css("a").first.text.strip
      event.tags = event_item.search("div.term").first.text.strip
      event.date = event_item.search("div.eventdate").first.text.gsub(/\n|\t/, "").strip
      link = "http://downtownpittsburgh.com" + event_item.search("a.button").first.attr("href").strip
      doc_event = Nokogiri::HTML(open(link))
      event.website = doc_event.search("div.eventlink").first.css("a").first.attr("href").strip
      @@all << event
    end
  end

  
  binding.pry
end
