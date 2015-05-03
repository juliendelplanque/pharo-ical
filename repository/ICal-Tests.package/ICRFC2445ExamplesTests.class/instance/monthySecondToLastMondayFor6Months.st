rfc2445-rules
monthySecondToLastMondayFor6Months
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 22
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=6;BYDAY=-2MO'