rfc2445-rules
monthyFirstAndLastSundayFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 7
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;INTERVAL=2;COUNT=10;BYDAY=1SU,-1SU'