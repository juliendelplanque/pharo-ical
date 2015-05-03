date
fromICalDateString: aString class: aClass
	| yearMonthDay |
	yearMonthDay := self splitYearMonthDayICal: aString.
	^aClass
		year: (yearMonthDay first)
		month: (yearMonthDay second)
		day: (yearMonthDay third)