rfc2445-rules
everyThuInJunJulAugForever
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYDAY=TH;BYMONTH=6,7,8'