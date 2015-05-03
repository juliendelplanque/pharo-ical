rfc2445-rules
monthyThirdToLastDayForever
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 28
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYMONTHDAY=-3'