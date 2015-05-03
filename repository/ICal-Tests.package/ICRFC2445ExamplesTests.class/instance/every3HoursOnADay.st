rfc2445-rules
every3HoursOnADay
	"The RFC 2445 example appears to be wrong.
	See: http://www.imc.org/ietf-calendar/mail-archive/msg01848.html
	
	Example:
		FREQ=HOURLY;INTERVAL=3;UNTIL=19970902T170000Z
	The UNTIL value must be adjusted by the timezone offset.
	"

	| untilValue |
	untilValue := self dateAndTimeClass
		year: 1997
		month: 9
		day: 2
		hour: 17
		minute: 0
		second: 0.
	^ ICRecurrenceRule fromICalString: 'FREQ=HOURLY;INTERVAL=3;UNTIL=' , untilValue asICalString