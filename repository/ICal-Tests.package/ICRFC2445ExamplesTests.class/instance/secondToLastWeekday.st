rfc2445-rules
secondToLastWeekday
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 29
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYDAY=MO,TU,WE,TH,FR;BYSETPOS=-2'