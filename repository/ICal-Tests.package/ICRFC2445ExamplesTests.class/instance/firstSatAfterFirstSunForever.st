rfc2445-rules
firstSatAfterFirstSunForever
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 13
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYDAY=SA;BYMONTHDAY=7,8,9,10,11,12,13'