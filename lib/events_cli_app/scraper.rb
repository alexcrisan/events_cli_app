class EventsCliApp::Scraper

  def self.scrape_events
    doc = Nokogiri::HTML(open("http://downtownpittsburgh.com/events/"))
    doc.css(".eventitem").each do |event_item|
      event = EventsCliApp::Event.new
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
      EventsCliApp::Event.all << event
    end
  end

end
