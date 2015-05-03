private
timezoneRecurrenceDate
	| timezone standard daylight |
	timezone := ICTimezone new.
	timezone id: 'US-Eastern'.
	timezone lastModified: (self dateAndTimeClass year: 1987 month: 01 day:  01 hour: 0 minute: 0 second: 0  offset: (self durationClass seconds: 0)).
	
	standard := ICStandardTime new.
	standard start: (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 02 minute: 00 second: 0).
	standard addRecurrenceDate: (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 02 minute: 00 second: 0).
	standard offsetFrom: (ICUtcOffset new positive: false; hours: 4; yourself).
	standard offsetTo: (ICUtcOffset new positive: false; hours: 5; yourself).
	standard addName: 'EST'.
	timezone addStandardTime: standard.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 02 minute: 00 second: 0).
	daylight addRecurrenceDate: (self dateAndTimeClass year: 1997 month: 04 day: 06 hour: 02 minute: 00 second: 0).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	^timezone