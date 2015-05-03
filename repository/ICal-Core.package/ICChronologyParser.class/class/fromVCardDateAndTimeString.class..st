date-time
fromVCardDateAndTimeString: aString class: aClass
	| yearMonthDay hourMinuteSecond |
	yearMonthDay := self splitYearMonthDayVCard: (aString copyUpTo: $T).
	hourMinuteSecond := self splitHourMinuteSecondVCard: (aString copyAfter: $T).
	"aString includes: $T"
	^aClass
		year: yearMonthDay first
		month: yearMonthDay second
		day: yearMonthDay third
		hour: hourMinuteSecond first
		minute: hourMinuteSecond second
		second: hourMinuteSecond third