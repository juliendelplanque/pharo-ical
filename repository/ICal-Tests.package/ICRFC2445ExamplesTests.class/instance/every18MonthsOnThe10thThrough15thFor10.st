rfc2445-rules
every18MonthsOnThe10thThrough15thFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 10
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;INTERVAL=18;COUNT=10;BYMONTHDAY=10,11,12,13,14,15'