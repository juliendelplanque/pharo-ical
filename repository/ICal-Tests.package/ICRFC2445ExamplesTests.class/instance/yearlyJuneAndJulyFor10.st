rfc2445-rules
yearlyJuneAndJulyFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 10
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;COUNT=10;BYMONTH=6,7'