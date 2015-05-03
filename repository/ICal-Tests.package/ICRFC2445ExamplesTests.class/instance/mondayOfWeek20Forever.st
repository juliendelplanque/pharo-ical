rfc2445-rules
mondayOfWeek20Forever
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 12
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYWEEKNO=20;BYDAY=MO'