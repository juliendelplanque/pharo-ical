date-time
fromICalDateAndTimeString: aString class: aClass
	| yearMonthDay hourMinuteSecond |
	yearMonthDay := self splitYearMonthDayICal: (aString first: 8).
	hourMinuteSecond := self splitHourMinuteSecondICal: (aString allButFirst: 9).
	^ (aString size > 15 and: [ (aString at: 16) = $Z ])
		ifTrue: [
			aClass
				year: yearMonthDay first
				month: yearMonthDay second
				day: yearMonthDay third
				hour: hourMinuteSecond first
				minute: hourMinuteSecond second
				second: hourMinuteSecond third
				offset: Duration zero ]
		ifFalse: [
			aClass
				year: yearMonthDay first
				month: yearMonthDay second
				day: yearMonthDay third
				hour: hourMinuteSecond first
				minute: hourMinuteSecond second
				second: hourMinuteSecond third ]
