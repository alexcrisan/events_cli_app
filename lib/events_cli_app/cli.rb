# our cli controller - deals with user interactions
class EventsCliApp::CLI

  attr_accessor :name, :tags, :description, :date, :link, :website
  def call #the call method is reserved by ruby and is called when the program runs.
    list_events
    menu
  end

  def list_events
    #puts numbered events list in alphabetical order
    puts "1. Dancing with the stars."
    puts "2. Dancing with the weirdos."
  end

  def list_events_by_date
  end

  def list_events_by_tag
  end

  def show_description(event)
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter a menu item number 1-3, or type 'exit' to escape program:"
      input = gets.strip
      case input
      when "1"
        #print events list alphabetically
      when "2"
        #print events by tag.
      when "3"
        #print events by date.
      when "list"
        list_events
      else
        puts "Please enter a valid number, type 'list' to see all events, or 'exit' to exit."
      end
    end
    goodbye
  end

  def goodbye
    puts "See you later, alligator!"
  end
end
