rfc2445-rules
weekStartTest2
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;COUNT=4;BYDAY=TU,SU;WKST=SU'