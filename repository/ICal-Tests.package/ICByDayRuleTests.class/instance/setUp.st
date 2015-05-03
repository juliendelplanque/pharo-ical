as yet unclassified
setUp
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYDAY=SA,TU').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first