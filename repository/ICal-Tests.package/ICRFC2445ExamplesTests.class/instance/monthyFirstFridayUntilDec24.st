rfc2445-rules
monthyFirstFridayUntilDec24
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;UNTIL=19971224T000000Z;BYDAY=1FR'