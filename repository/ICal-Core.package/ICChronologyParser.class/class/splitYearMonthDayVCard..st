date
splitYearMonthDayVCard: aString
	^self splitYearMonthDayICal: (aString reject: [ :each | each = $- ])