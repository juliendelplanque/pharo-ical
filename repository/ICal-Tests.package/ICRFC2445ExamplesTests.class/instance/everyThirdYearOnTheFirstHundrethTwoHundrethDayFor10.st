rfc2445-rules
everyThirdYearOnTheFirstHundrethTwoHundrethDayFor10
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;INTERVAL=3;COUNT=10;BYYEARDAY=1,100,200'