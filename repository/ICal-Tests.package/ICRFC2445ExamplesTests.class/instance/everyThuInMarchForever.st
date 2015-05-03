rfc2445-rules
everyThuInMarchForever
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 13
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYMONTH=3;BYDAY=TH'