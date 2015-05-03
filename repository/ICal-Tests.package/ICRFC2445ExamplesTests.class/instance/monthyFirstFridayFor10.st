rfc2445-rules
monthyFirstFridayFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=10;BYDAY=1FR'