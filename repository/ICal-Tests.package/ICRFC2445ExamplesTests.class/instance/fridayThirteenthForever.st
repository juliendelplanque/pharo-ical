rfc2445-rules
fridayThirteenthForever
	event
		addExclusionDate:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYDAY=FR;BYMONTHDAY=13'