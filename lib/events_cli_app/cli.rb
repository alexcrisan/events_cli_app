class EventsCliApp::CLI

  attr_accessor :name, :tags, :description, :date, :link, :website
  def call 
    get_events
    menu
  end

  def get_events
    EventsCliApp::Scraper.scrape_events
  end

  def list_events_alphabetically
    sorted_events = EventsCliApp::Event.all.sort_by {|event| event.name}
    sorted_events.each {|event| puts (sorted_events.index(event) + 1).to_s + ". " + event.name}
  end

  def list_events_with_date
    sorted_events = EventsCliApp::Event.all.sort_by {|event| event.name}
    sorted_events.each {|event| puts (sorted_events.index(event) + 1).to_s + ". " + event.name + " - " + event.date}
  end

  def list_events_with_tags
    sorted_events = EventsCliApp::Event.all.sort_by {|event| event.name}
    sorted_events.each {|event| puts (sorted_events.index(event) + 1).to_s + ". " + event.name + " - " + event.tags.to_s}
  end

  def menu
    input = nil
    while input != 'exit' && !(input =~ /\d/)
      puts "Enter 'a' to list alphabetically, 'd' to list with date, and 't' to list by tags, or type 'exit' to escape program:"
      input = gets.strip.downcase
      case input
      when "a"
        self.list_events_alphabetically
        puts "You may enter a number corresponding to an event to see more details for that event."
      when "t"
        self.list_events_with_tags
        tag = nil
        until tag == "exit"
          puts "Enter a tag title such as 'entertainment' or 'culture' to show all related events. Type 'exit' to go back to the main menu."
          tag = gets.strip.downcase
          EventsCliApp::Event.filter_by_tag(tag).each {|event| puts event.name + " - " + event.date}
        end
      when "d"
        self.list_events_with_date
      when "list"
        list_events_alphabetically
      else
        if input =~ /\d/ && input.to_i > 0 && input.to_i < EventsCliApp::Event.all.length
          index = input.to_i - 1
          EventsCliApp::Event.show_details(index)
          self.menu
        else
          puts "Please enter a valid number between 1 and #{EventsCliApp::Event.all.length}, type 'list' to see all events, or 'exit' to exit."
        end
      end
    end
    goodbye
  end

  def goodbye
    puts "See you later, alligator!"
  end
end
