as yet unclassified
setUp
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYMONTHDAY=14,-12').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first