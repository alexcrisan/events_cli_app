# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application.
I have created a CLI file in lib/events_cli_app/cli.rb where the #call method instantiates the program, and by doing so, calls three other methods in succession: #introduction, #get_events, and #menu. #introduction simply prints out a welcome message and asks the user to wait patiently while the events list is populated. #get_events calls the #scrape_events method in the EventsCliApp::Scraper file which populates the @@all class array with new event objects that each have a name, tags, date, and website url (as attributes).
The #menu method describes the program functionality to the user and accepts inputs. The #menu has depth - depending on what the user enters at the first level, there will be additional options to choose from.
- [x] Pull data from an external source.
The class EventsCliApp::Scraper contains one method, #scrape_events, that is responsible for pulling data and creating event objects according to event titles. The each iterator goes through each event, creates a corresponding event objects, mines additional data, assigns that data to the event object as attributes, and then adds that event object to the Event class @@ll class array.
- [x] Implement both list and detail views.
The EventsCliApp::Event class is responsible for instantiating Event objects, storing them, filtering events by tag name, and displaying a detailed view of each event.
