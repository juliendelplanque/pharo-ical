rfc2445-rules
usPresidentialElectionDay
	event
		start:
			(self dateAndTimeClass
				year: 1996
				month: 11
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;INTERVAL=4;BYMONTH=11;BYDAY=TU;BYMONTHDAY=2,3,4,5,6,7,8'