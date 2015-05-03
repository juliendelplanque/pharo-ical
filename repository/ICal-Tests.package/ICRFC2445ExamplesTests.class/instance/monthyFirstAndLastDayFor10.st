rfc2445-rules
monthyFirstAndLastDayFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 30
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=10;BYMONTHDAY=1,-1'