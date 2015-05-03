examples
example1
	"self example1"
	| calendar event exporter |
	calendar := ICCalendar new.
	event :=( ICEvent summary: 'demo event')
		start: Date today;
		addRecurrenceRule: ICRecurrenceRule weekly; 
		yourself.
	calendar addEvent: event.
	
	exporter := self calendar: calendar.
	exporter dataStream: (FileStream forceNewFileNamed: 'demo.ics').
	exporter export.
	