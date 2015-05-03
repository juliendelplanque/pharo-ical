as yet unclassified
setUp
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYWEEKNO=-38,14').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first