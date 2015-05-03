date
fromVCardDateString: aString class: aClass
	^(aString includesSubstring: '-')
		ifFalse: [ self fromICalDateString: aString class: aClass ]
		ifTrue:  [
			| yearMonthDay |
			yearMonthDay := self splitYearMonthDayVCard: aString.
			aClass
				year: (yearMonthDay first)
				month: (yearMonthDay second)
				day: (yearMonthDay third) ]	