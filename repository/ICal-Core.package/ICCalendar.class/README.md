I am the representation of a iCalendar.

I contain:
- categories
- journals
- timezones
- todos
- events
- users
- free busy

It's possible to iterate over my events using
ICCalendar>>enventsDo: aBlock

You can do similar things with my others collections (todos, free busy, etc...).

You can instanciate me using:
- My class message name: 

Or get an instance of me generate from a file using ICCalendarHandParser>>parseCalendarFile: aFilePath