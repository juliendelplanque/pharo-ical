rfc2445-rules
thirdTuesWedsOrThursForNextThreeMonths
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 4
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=3;BYDAY=TU,WE,TH;BYSETPOS=3'