User types "events" to start the app. 

The Event class will have many events stored in @@events.

#initialize will parse a list of events from a URL (http://downtownpittsburgh.com/events/) and create event objects with attributes:
* @tags (each tag attribute is a list of hashes (symbols such as :entertainment, :comedy, etc.)
* @name
* @description
* @date
* @link (to read more)
* @event_website (click on read more to see)



Make method that can list all the events by alphabetical order, or by date,


CLI
1. Present user with list of options or type
    - Print all events in alphabetical order
    - Print all events by date.
    - Print all events associated with a tag.
2. Ask the user to “Type a request number (1-3)”
3. Ask user the same question until he/she types “end”
