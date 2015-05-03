rfc2445-rules
everyTwentiethMondayForever
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 19
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYDAY=20MO'