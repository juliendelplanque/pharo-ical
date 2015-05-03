rfc2445-rules
everyOtherYearJanFebMarFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 10
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;INTERVAL=2;COUNT=10;BYMONTH=1,2,3'