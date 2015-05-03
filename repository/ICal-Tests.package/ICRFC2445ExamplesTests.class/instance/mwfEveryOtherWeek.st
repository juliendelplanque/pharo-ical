rfc2445-rules
mwfEveryOtherWeek
	"  Every other week on Monday, Wednesday and Friday until December 24,
   1997, but starting on Tuesday, September 2, 1997:"

	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;UNTIL=19971224T000000Z;WKST=SU;BYDAY=MO,WE,FR'